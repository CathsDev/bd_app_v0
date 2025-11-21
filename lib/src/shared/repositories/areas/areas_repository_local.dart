import 'dart:convert';

import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:bd_app_v0/src/shared/repositories/areas/areas_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AreasRepositoryLocal implements AreasRepository {
  final SharedPreferences _preferences;

  AreasRepositoryLocal({required SharedPreferences preferences})
    : _preferences = preferences;

  static const _kAreasKey = 'user_areas';

  Future<List<Area>> _loadAreas() async {
    final areaList = _preferences.getStringList(_kAreasKey) ?? const <String>[];
    final areas = areaList
        .map(
          (jsonString) =>
              Area.fromJson(jsonDecode(jsonString) as Map<String, dynamic>),
        )
        .toList(growable: true);

    if (areas.isEmpty) {
      throw Exception('No areas found in local storage.');
    }

    return areas;
  }

  Future<void> _saveAreas(List<Area> areas) async {
    final areaList = areas.map((area) => jsonEncode(area.toJson())).toList();
    await _preferences.setStringList(_kAreasKey, areaList);
  }

  @override
  Future<List<Area>> getActiveAreas() async {
    final allAreas = await getAllAreas();
    return allAreas.where((area) => area.isActive).toList(growable: false);
  }

  @override
  Future<List<Area>> getAllAreas() async {
    return _loadAreas();
  }

  @override
  Future<Area> getAreaById(String id) async {
    final allAreas = await getAllAreas();
    final index = allAreas.indexWhere((area) => area.id == id);
    if (index < 0) throw Exception('Area not found');
    return allAreas[index];
  }

  @override
  Future<void> setAreaStatus(String id, bool isActive) async {
    final allAreas = await _loadAreas();
    final index = allAreas.indexWhere((area) => area.id == id);

    if (index < 0) throw Exception('Area not found');

    if (allAreas[index].isActive == isActive) return;

    if (isActive == false) {
      final allAreasLength = allAreas.where((area) => area.isActive).length;
      if (allAreasLength == 1) {
        throw Exception('Mindestens ein Raum muss aktiv bleiben');
      }
    }

    final currentArea = allAreas[index];

    allAreas[index] = currentArea.copyWith(isActive: isActive);

    await _saveAreas(allAreas);
  }
}
