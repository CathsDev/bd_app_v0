import 'dart:async';

import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreasNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> updateAreaStatus(String id, bool isActive) async {
    state = await AsyncValue.guard(() async {
      final areasRepo = await ref.read(areasRepositoryProvider.future);
      await areasRepo.setAreaStatus(id, isActive);
    });

    ref.invalidate(allUserAreasProvider);
    ref.invalidate(allActiveUserAreasProvider);
  }
}
