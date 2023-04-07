import 'dart:convert';

import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaneSpecificationStorage {
  PlaneSpecificationStorage();

  late final _prefs = SharedPreferences.getInstance();

  static const _planeSpecificationsKey = 'plane-specs-v1';

  Future<List<PlaneSpecification>> getAll() async {
    final json = (await _prefs).getString(_planeSpecificationsKey);
    if (json == null) {
      return [];
    }

    return List<Map<String, dynamic>>.from(jsonDecode(json) as List)
        .map(PlaneSpecification.fromJson)
        .toList();
  }

  Future<void> save(List<PlaneSpecification> planes) async {
    final prefs = await _prefs;
    await prefs.setString(_planeSpecificationsKey, jsonEncode(planes));
  }
}
