import 'package:aw_pilot_helper/screens/entry/entry_screen.dart';
import 'package:aw_pilot_helper/screens/previous_entries/bloc/previous_entries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousEntriesScreenRoute extends MaterialPageRoute<void> {
  PreviousEntriesScreenRoute()
      : super(builder: (context) => const PreviousEntriesScreen());
}

class PreviousEntriesScreen extends StatelessWidget {
  const PreviousEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch<PreviousEntriesCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poprzednie wpisy'),
      ),
      body: entries.isEmpty
          ? const Center(
              child: Text('Nie masz żadnego wpisu.'),
            )
          : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, i) {
                final entry = entries[i];

                return Dismissible(
                  key: ValueKey(entry.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) =>
                      context.read<PreviousEntriesCubit>().remove(entry.id),
                  background: Container(
                    color: Colors.red.shade100,
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Icon(Icons.delete),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.flight),
                    title: Text(entry.content.name),
                    subtitle: Text(
                      '${entry.planeSpecification.name} • '
                      '${entry.planeSpecification.type}',
                    ),
                    onTap: () => Navigator.of(context)
                        .push(EntryScreenRoute.edit(entry)),
                  ),
                );
              },
            ),
    );
  }
}
