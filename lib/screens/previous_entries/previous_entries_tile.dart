import 'package:aw_pilot_helper/screens/previous_entries/bloc/previous_entries_cubit.dart';
import 'package:aw_pilot_helper/screens/previous_entries/previous_entries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PreviousEntriesTile extends StatelessWidget {
  const PreviousEntriesTile({super.key});

  @override
  Widget build(BuildContext context) {
    final countFormat = NumberFormat.decimalPattern();

    final count =
        context.select<PreviousEntriesCubit, int>((c) => c.state.length);
    final countText = countFormat.format(count);

    return ListTile(
      leading: const Icon(Icons.list),
      title: Text('Poprzednie wpisy ($countText)'),
      onTap: () => Navigator.of(context).push(PreviousEntriesScreenRoute()),
    );
  }
}
