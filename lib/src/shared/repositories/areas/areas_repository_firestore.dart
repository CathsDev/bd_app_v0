import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:bd_app_v0/src/shared/repositories/areas/areas_repository.dart';

// Later: Schon mal vorbereitet, damit der User später eine Cloud Funktion hat
class AreasRepositoryFirestore implements AreasRepository {
  @override
  Future<List<Area>> getActiveAreas() {
    // Later: implement getActiveAreas
    throw UnimplementedError('Cloud Backup coming soon');
  }

  @override
  Future<List<Area>> getAllAreas() {
    // Later: implement getAllAreas
    throw UnimplementedError('Cloud Backup coming soon');
  }

  @override
  Future<Area> getAreaById(String id) {
    // Later: implement getAreaById
    throw UnimplementedError('Cloud Backup coming soon');
  }

  @override
  Future<void> setAreaStatus(String id, bool isActive) {
    // Later: implement setAreaStatus
    throw UnimplementedError('Cloud Backup coming soon');
  }
}
