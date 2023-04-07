import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/before_flight_tab.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/flight_time_tab.dart';
import 'package:aw_pilot_helper/screens/entry/notes_tab.dart';
import 'package:aw_pilot_helper/screens/entry/weighing_tab.dart';
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
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.target.isCreate ? 'Nowy wpis' : 'Edytuj wpis';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 2),
            BlocBuilder<EntryCubit, Entry>(
              builder: (context, state) {
                final plane = state.planeSpecification;

                return Text(
                  '${plane.name} • ${plane.type}',
                  style: Theme.of(context).textTheme.labelMedium?.apply(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                );
              },
            ),
          ],
        ),
        actions: [
          BlocBuilder<EditLockCubit, bool>(
            builder: (context, locked) => IconButton(
              icon: Icon(locked ? Icons.lock : Icons.lock_open),
              onPressed: locked
                  ? () => context.read<EditLockCubit>().unlock()
                  : () => context.read<EditLockCubit>().lock(),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BeforeFlightTab(),
          WeighingTab(),
          FlightTimeTab(),
          NotesTab(),
        ],
      ),
      bottomNavigationBar: Builder(
        builder: (context) => AnimatedBuilder(
          animation: _tabController,
          builder: (context, _) => BottomNavigationBar(
            currentIndex: _tabController.index,
            onTap: _tabController.animateTo,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.flight_takeoff),
                label: 'Przed lotem',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.scale),
                label: 'Wyważenie',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Czas lotu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notes),
                label: 'Notatki',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
