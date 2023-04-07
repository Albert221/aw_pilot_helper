import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/screens/previous_entries/bloc/previous_entries_cubit.dart';
import 'package:aw_pilot_helper/screens/previous_entries/previous_entries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousEntriesTile extends StatelessWidget {
  const PreviousEntriesTile({super.key});

  @override
  Widget build(BuildContext context) {
    final count =
        context.select<PreviousEntriesCubit, int>((c) => c.state.length);

    return ListTile(
      leading: const Icon(Icons.list),
      title: Text(context.l10n.previousEntriesTile_title(count)),
      onTap: () => Navigator.of(context).push(PreviousEntriesScreenRoute()),
    );
  }
}
