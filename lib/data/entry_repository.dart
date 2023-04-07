import 'dart:async';

import 'package:aw_pilot_helper/data/storage/entry_storage.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:rxdart/rxdart.dart';

class EntryRepository {
  EntryRepository(this._storage);

  final EntryStorage _storage;

  final _streamController = BehaviorSubject<List<Entry>>();

  Future<void> dispose() async {
    await _streamController.close();
  }

  Stream<List<Entry>> getAll() {
    _storage.getAll().then(_streamController.add);
    return _streamController.stream;
  }

  Future<void> upsertEntry(Entry entry) async {
    final entries = await _storage.getAll();
    final index = entries.indexWhere((anEntry) => anEntry.id == entry.id);
    if (index == -1) {
      entries.add(entry);
    } else {
      entries[index] = entry;
    }

    await _storage.save(entries);
    _streamController.add(entries.readOnly);
  }

  Future<void> removeEntry(String entryId) async {
    final entries = await _storage.getAll()
      ..removeWhere((entry) => entry.id == entryId);

    await _storage.save(entries);
    _streamController.add(entries);
  }
}
