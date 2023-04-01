import 'dart:async';

import 'package:aw_pilot_helper/data/planes.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:rxdart/rxdart.dart';

class EntryRepository {
  EntryRepository() {
    _broadcastChanges();
  }

  final _entries = <String, Entry>{
    '5156f765-7a00-4913-8d9b-ee4e4a2ed009': const Entry(
      id: '5156f765-7a00-4913-8d9b-ee4e4a2ed009',
      planeSpecification: spTpe,
      content: EntryContent(
        name: 'test',
        motohours: 2393.6,
        oil: 3.3,
        fuelBefore: [35, 35],
        weight: [145, 2],
        notes: 'Hey! :)',
      ),
    ),
  };

  final _streamController = BehaviorSubject<List<Entry>>();

  Future<void> dispose() async {
    await _streamController.close();
  }

  void _broadcastChanges() {
    _streamController.add(List.unmodifiable(_entries.values));
  }

  Stream<List<Entry>> getAll() {
    return _streamController.stream;
  }

  Future<void> upsertEntry(Entry entry) async {
    _entries[entry.id] = entry;
    _broadcastChanges();
  }

  Future<void> removeEntry(String entryId) async {
    _entries.remove(entryId);
    _broadcastChanges();
  }
}
