import 'package:bd_app_v0/src/shared/domain/area.dart';

abstract class AreasRepository {
  Future<List<Area>> getAllAreas();

  Future<List<Area>> getActiveAreas();

  Future<Area> getAreaById(String id);

  Future<void> addArea(String name);

  Future<void> setAreaStatus(String id, bool isActive);
}
