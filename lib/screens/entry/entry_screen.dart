import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/before_flight_tab.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/flight_time_tab.dart';
import 'package:aw_pilot_helper/screens/entry/notes_tab.dart';
import 'package:aw_pilot_helper/screens/entry/weighing_tab.dart';
import 'package:aw_pilot_helper/utils/hct_color_tween.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EntryScreenTarget {
  create,
  edit;

  bool get isCreate => this == EntryScreenTarget.create;
  bool get isEdit => this == EntryScreenTarget.edit;
}

class EntryScreenRoute extends MaterialPageRoute<void> {
  EntryScreenRoute.create(PlaneSpecification plane)
      : super(
          builder: _builder(
            locked: false,
            entry: Entry.empty(plane),
            target: EntryScreenTarget.create,
          ),
        );

  EntryScreenRoute.edit(Entry entry)
      : super(
          builder: _builder(
            locked: true,
            entry: entry,
            target: EntryScreenTarget.edit,
          ),
        );

  static WidgetBuilder _builder({
    required bool locked,
    required EntryScreenTarget target,
    required Entry entry,
  }) {
    return (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EditLockCubit(locked)),
          BlocProvider(
            create: (context) => EntryCubit(
              entry,
              context.read(),
            ),
          ),
        ],
        child: EntryScreen(target: target),
      );
    };
  }
}

class EntryScreen extends StatefulWidget {
  const EntryScreen({
    super.key,
    required this.target,
  });

  final EntryScreenTarget target;

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with SingleTickerProviderStateMixin {
  final _bodyFocusNode = FocusNode(debugLabel: 'Entry screen body');
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bodyFocusNode.dispose();

    super.dispose();
  }

  // Unfocuses focused text field when back button is pressed instead of
  // navigating back.
  Future<bool> _onWillPop() async {
    final locked = context.read<EditLockCubit>().state;
    if (!locked && _bodyFocusNode.hasFocus) {
      FocusScope.of(context).unfocus();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _AppBar(target: widget.target),
        body: Focus(
          focusNode: _bodyFocusNode,
          canRequestFocus: false,
          descendantsAreFocusable: !locked,
          child: TabBarView(
            controller: _tabController,
            children: const [
              BeforeFlightTab(),
              WeighingTab(),
              FlightTimeTab(),
              NotesTab(),
            ],
          ),
        ),
        bottomNavigationBar: Builder(
          builder: (context) => AnimatedBuilder(
            animation: _tabController,
            builder: (context, _) => BottomNavigationBar(
              currentIndex: _tabController.index,
              onTap: _tabController.animateTo,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.flight_takeoff),
                  label: context.l10n.entry_beforeFlight,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.scale),
                  label: context.l10n.entry_weighting,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.timer),
                  label: context.l10n.entry_flightTime,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.notes),
                  label: context.l10n.entry_notes,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({required this.target});

  final EntryScreenTarget target;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;

    return TweenAnimationBuilder<Color?>(
      tween: HctColorTween(
        end: locked ? Theme.of(context).colorScheme.primary : Colors.green,
      ),
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      builder: (context, color, child) => Material(
        color: color,
        elevation: 4,
        child: child,
      ),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: const TextFieldTapRegion(
          child: BackButton(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Title(target: target),
            const SizedBox(height: 2),
            BlocBuilder<EntryCubit, Entry>(
              builder: (context, state) => Text(
                context.l10n.entry_subtitle(
                  state.planeSpecification.name,
                  state.planeSpecification.type,
                ),
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          BlocBuilder<EditLockCubit, bool>(
            builder: (context, locked) => IconButton(
              icon: Icon(locked ? Icons.edit : Icons.save),
              onPressed: locked
                  ? () => context.read<EditLockCubit>().unlock()
                  : () => context.read<EditLockCubit>().lock(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.target});

  final EntryScreenTarget target;

  @override
  Widget build(BuildContext context) {
    final title = target.isCreate
        ? context.l10n.entry_titleCreate
        : context.l10n.entry_titleEdit;

    final locked = context.watch<EditLockCubit>().state;

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstCurve: const Interval(0, 2 / 3),
      secondCurve: const Interval(1 / 3, 1),
      crossFadeState:
          locked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Text(context.l10n.entry_titlePreview),
      secondChild: Text(title),
    );
  }
}
