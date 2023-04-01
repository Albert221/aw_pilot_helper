import 'dart:async';

import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousEntriesCubit extends Cubit<List<Entry>> {
  PreviousEntriesCubit(this._repository) : super(const []) {
    _subscription = _repository.getAll().listen(emit);
  }

  final EntryRepository _repository;

  late final StreamSubscription<List<Entry>> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  Future<void> remove(String id) async {
    try {
      await _repository.removeEntry(id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
