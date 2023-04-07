import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesTab extends StatefulWidget {
  const NotesTab({super.key});

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> with DidInitMixin<NotesTab> {
  late final StringTextEditingController<EntryCubit, Entry> _controller;

  @override
  void didInitState() {
    _controller = StringTextEditingController(
      cubit: context.read<EntryCubit>(),
      mapValue: (state) => state.content.notes,
      updateValue: (cubit, notes) => cubit.updateNotes(notes),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;

    return TextField(
      controller: _controller,
      readOnly: locked,
      maxLines: null,
      autofocus: true,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Wpisz tutaj notatki...',
        contentPadding: EdgeInsets.all(24),
      ),
    );
  }
}
