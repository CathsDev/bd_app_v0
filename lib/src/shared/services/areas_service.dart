import 'dart:convert';

import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AreasService {
  Future<List<Area>> loadAreaCatalog() async {
    final jsonAreasString = await rootBundle.loadString(
      'assets/data/areas_catalog.json',
    );

    final jsonAreasList = jsonDecode(jsonAreasString) as List<dynamic>;

    final areas = jsonAreasList
        .map((json) => Area.fromJson((json) as Map<String, dynamic>))
        .toList();

    if (areas.isEmpty) {
      throw Exception('No areas found in areas_catalog.json');
    }
    return areas;
  }

  Future<void> initializeUserAreas(SharedPreferences prefs) async {
    final kUserAreas = 'user_areas';
    final localUserAreas = prefs.getStringList(kUserAreas);
    if (localUserAreas != null) return;
    try {
      final userAreas = await loadAreaCatalog();
      final userAreasList = userAreas.map((area) {
        return jsonEncode(area.toJson());
      }).toList();
      prefs.setStringList(kUserAreas, userAreasList);
    } catch (e) {
      throw Exception('Failed to initialize areas: $e');
    }
  }
}
