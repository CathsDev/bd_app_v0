import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:bd_app_v0/src/shared/repositories/areas/areas_repository.dart';
import 'package:bd_app_v0/src/shared/repositories/areas/areas_repository_local.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final areasRepositoryProvider = FutureProvider<AreasRepository>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return AreasRepositoryLocal(preferences: prefs);
});

final allUserAreasProvider = FutureProvider<List<Area>>((ref) async {
  final areasRepo = await ref.watch(areasRepositoryProvider.future);
  final allAreas = await areasRepo.getAllAreas();
  return allAreas;
});

final allActiveUserAreasProvider = FutureProvider<List<Area>>((ref) async {
  final areasRepo = await ref.watch(areasRepositoryProvider.future);
  final allActiveAreas = await areasRepo.getActiveAreas();
  return allActiveAreas;
});

final areasNotifierProvider = AsyncNotifierProvider<AreasNotifier, void>(
  AreasNotifier.new,
);

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});
