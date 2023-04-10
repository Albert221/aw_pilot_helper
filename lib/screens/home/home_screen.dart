import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/screens/about/about_screen.dart';
import 'package:aw_pilot_helper/screens/entry/entry_screen.dart';
import 'package:aw_pilot_helper/screens/home/bloc/planes_cubit.dart';
import 'package:aw_pilot_helper/screens/previous_entries/previous_entries_tile.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenRoute extends MaterialPageRoute<void> {
  HomeScreenRoute()
      : super(
          builder: (context) => BlocProvider<PlanesCubit>(
            create: (context) => PlanesCubit(context.read()),
            child: const HomeScreen(),
          ),
        );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onPresentationEvent(
    BuildContext context,
    PlanesPresentationEvent event,
  ) {
    final errorText = event.when(
      noInternet: () => context.l10n.home_planeSpecsNoInternet,
      other: () => context.l10n.home_planeSpecsOtherError,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        content: Text(
          context.l10n.home_planeSpecsErrorEvent(errorText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final planesState = context.watch<PlanesCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
      ),
      body: BlocPresentationListener<PlanesCubit>(
        listener: (context, event) =>
            _onPresentationEvent(context, event as PlanesPresentationEvent),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: PreviousEntriesTile(),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(context.l10n.home_aboutApp),
                onTap: () => Navigator.of(context).push(AboutScreenRoute()),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ...planesState.when(
              loadInProgress: () => [
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
              loadFailure: (kind) => [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: _Failure(kind: kind),
                  ),
                )
              ],
              loadSuccess: (planes) => [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      context.l10n.home_newEntry,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final plane = planes[index];

                      return ListTile(
                        leading: const Icon(Icons.add),
                        title: Text(plane.name),
                        subtitle: Text(plane.type),
                        onTap: () => Navigator.of(context).push(
                          EntryScreenRoute.create(plane),
                        ),
                      );
                    },
                    childCount: planes.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  const _Failure({required this.kind});

  final PlanesStateFailure kind;

  @override
  Widget build(BuildContext context) {
    switch (kind) {
      case PlanesStateFailure.noInternet:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.signal_wifi_bad),
            const SizedBox(height: 16),
            Text(context.l10n.home_planeSpecsNoInternet),
          ],
        );
      case PlanesStateFailure.other:
        return const Text('Wystąpił błąd');
    }
  }
}
