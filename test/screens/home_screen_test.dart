import 'dart:async';

import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/l10n/output/app_localizations_en.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/home/bloc/planes_cubit.dart';
import 'package:aw_pilot_helper/screens/home/home_screen.dart';
import 'package:aw_pilot_helper/screens/previous_entries/bloc/previous_entries_cubit.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPlanesCubit extends MockCubit<PlanesState> implements PlanesCubit {}

class MockPreviousEntriesCubit extends MockCubit<List<Entry>>
    implements PreviousEntriesCubit {}

const planeSpecs = PlaneSpecification(
  name: 'SP-XYZ',
  type: 'Cessna Test',
  oilMin: 5,
  oilMax: 10,
  fuelTanks: [
    FuelTankSpecification(name: 'Left', arm: 30, capacity: 100),
  ],
  planeWeight: 600,
  planeMoment: 250,
  drawbarWeight: null,
  drawbarArm: null,
  weights: [
    WeightSpecification(name: 'Pilot', arm: 10),
  ],
);

void main() {
  group('Home screen', () {
    final l10n = L10nEn();

    late StreamController<BlocPresentationEvent> presentationController;
    late PlanesCubit planesCubit;

    late PreviousEntriesCubit previousEntriesCubit;

    setUp(() async {
      presentationController =
          StreamController<BlocPresentationEvent>.broadcast();
      planesCubit = MockPlanesCubit();
      when(() => planesCubit.presentation)
          .thenAnswer((_) => presentationController.stream);

      previousEntriesCubit = MockPreviousEntriesCubit();

      // This initializes date formatting
      await GlobalMaterialLocalizations.delegate.load(const Locale('en'));
    });

    tearDown(() {
      previousEntriesCubit.close();

      planesCubit.close();
      presentationController.close();
    });

    Future<void> setupHomeScreen(
      WidgetTester tester, {
      PlanesState? initialPlanesState,
      List<PlanesState> planesStates = const [],
      List<Entry>? initialPreviousEntries,
      List<List<Entry>> previousEntries = const [],
    }) async {
      whenListen<PlanesState>(
        planesCubit,
        Stream.fromIterable(planesStates),
        initialState: initialPlanesState ?? const PlanesState.loadInProgress(),
      );
      when(() => planesCubit.retry()).thenAnswer((_) async {});

      whenListen<List<Entry>>(
        previousEntriesCubit,
        Stream.fromIterable(previousEntries),
        initialState: initialPreviousEntries ?? const [],
      );

      await tester.pumpWidget(
        _TestApp(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<PlanesCubit>.value(value: planesCubit),
              BlocProvider<PreviousEntriesCubit>.value(
                value: previousEntriesCubit,
              ),
            ],
            child: const HomeScreen(),
          ),
        ),
      );
      await tester.pump();
    }

    group('shows correct amount of previous entries', () {
      testWidgets('when there are no entries', (tester) async {
        await setupHomeScreen(tester);

        expect(find.text(l10n.previousEntriesTile_title(0)), findsOneWidget);
      });

      testWidgets('when there are 17 entries', (tester) async {
        await setupHomeScreen(
          tester,
          previousEntries: [
            List.generate(
              17,
              (index) => Entry.empty(planeSpecs, l10n.localeName),
            ),
          ],
        );

        expect(find.text(l10n.previousEntriesTile_title(17)), findsOneWidget);
      });
    });

    group('planes', () {
      testWidgets('shows progress indicator on loading', (tester) async {
        await setupHomeScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text(l10n.home_newEntry), findsNothing);
      });

      group('loading error', () {
        testWidgets('shows initial internet error', (tester) async {
          await setupHomeScreen(
            tester,
            planesStates: const [
              PlanesState.loadFailure(PlanesStateFailure.noInternet),
            ],
          );

          await tester.pumpAndSettle();

          expect(find.byType(CircularProgressIndicator), findsNothing);
          expect(find.text(l10n.home_newEntry), findsNothing);

          expect(find.text(l10n.home_planeSpecsNoInternet), findsOneWidget);
          expect(find.text(l10n.home_planeSpecsTryAgain), findsOneWidget);
        });

        testWidgets('shows initial other error', (tester) async {
          await setupHomeScreen(
            tester,
            planesStates: const [
              PlanesState.loadFailure(PlanesStateFailure.other),
            ],
          );

          await tester.pumpAndSettle();

          expect(find.byType(CircularProgressIndicator), findsNothing);
          expect(find.text(l10n.home_newEntry), findsNothing);

          expect(find.text(l10n.home_planeSpecsOtherError), findsOneWidget);
          expect(find.text(l10n.home_planeSpecsTryAgain), findsOneWidget);
        });

        testWidgets(
          'tap on try again in internet error calls cubit',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadFailure(PlanesStateFailure.noInternet),
            );

            verifyNever(() => planesCubit.retry());
            await tester.tap(find.text(l10n.home_planeSpecsTryAgain));
            verify(() => planesCubit.retry()).called(1);
          },
        );

        testWidgets(
          'tap on try again in other error calls cubit',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadFailure(PlanesStateFailure.other),
            );

            verifyNever(() => planesCubit.retry());
            await tester.tap(find.text(l10n.home_planeSpecsTryAgain));
            verify(() => planesCubit.retry()).called(1);
          },
        );
      });

      testWidgets('shows loaded planes', (tester) async {
        await setupHomeScreen(
          tester,
          planesStates: const [
            PlanesState.loadSuccess(planes: [planeSpecs]),
          ],
        );

        await tester.pumpAndSettle();

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.text(l10n.home_newEntry), findsOneWidget);

        expect(find.text(planeSpecs.name), findsOneWidget);
        expect(find.text(planeSpecs.type), findsOneWidget);
      });

      group('presentation errors', () {
        testWidgets(
          'shows internet presentation error with loaded planes',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadSuccess(planes: [planeSpecs]),
            );

            expect(find.byType(SnackBar), findsNothing);

            presentationController
                .add(const PlanesPresentationEvent.noInternet());
            await tester.pumpAndSettle();

            final snackbar = find.byType(SnackBar);

            expect(snackbar, findsOneWidget);
            expect(
              find.descendant(
                of: snackbar,
                matching: find.textContaining(l10n.home_planeSpecsNoInternet),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: snackbar,
                matching: find.textContaining(l10n.home_planeSpecsRetry),
              ),
              findsOneWidget,
            );
          },
        );

        testWidgets(
          'shows other presentation error with loaded planes',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadSuccess(planes: [planeSpecs]),
            );

            expect(find.byType(SnackBar), findsNothing);

            presentationController.add(const PlanesPresentationEvent.other());
            await tester.pumpAndSettle();

            final snackbar = find.byType(SnackBar);

            expect(snackbar, findsOneWidget);
            expect(
              find.descendant(
                of: snackbar,
                matching: find.textContaining(l10n.home_planeSpecsOtherError),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: snackbar,
                matching: find.textContaining(l10n.home_planeSpecsRetry),
              ),
              findsOneWidget,
            );
          },
        );

        testWidgets(
          'tap on internet presentation error retry calls cubit',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadSuccess(planes: [planeSpecs]),
            );
            presentationController
                .add(const PlanesPresentationEvent.noInternet());
            await tester.pumpAndSettle();

            verifyNever(() => planesCubit.retry());
            await tester.tap(
              find.descendant(
                of: find.byType(SnackBar),
                matching: find.text(l10n.home_planeSpecsRetry),
              ),
            );
            verify(() => planesCubit.retry()).called(1);
          },
        );

        testWidgets(
          'tap on internet presentation error retry calls cubit',
          (tester) async {
            await setupHomeScreen(
              tester,
              initialPlanesState:
                  const PlanesState.loadSuccess(planes: [planeSpecs]),
            );
            presentationController.add(const PlanesPresentationEvent.other());
            await tester.pumpAndSettle();

            verifyNever(() => planesCubit.retry());
            await tester.tap(
              find.descendant(
                of: find.byType(SnackBar),
                matching: find.text(l10n.home_planeSpecsRetry),
              ),
            );
            verify(() => planesCubit.retry()).called(1);
          },
        );
      });
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      home: child,
    );
  }
}
