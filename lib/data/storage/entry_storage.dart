import 'dart:convert';

import 'package:aw_pilot_helper/models/entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntryStorage {
  EntryStorage();

  late final _prefs = SharedPreferences.getInstance();

  static const _entriesKey = 'entries-v1';

  Future<List<Entry>?> getAll() async {
    final json = (await _prefs).getString(_entriesKey);
    if (json == null) {
      return null;
    }

    return List<Map<String, dynamic>>.from(jsonDecode(json) as List)
        .map(Entry.fromJson)
        .toList();
  }

  Future<void> save(List<Entry> entries) async {
    final prefs = await _prefs;
    await prefs.setString(_entriesKey, jsonEncode(entries));
  }
}
