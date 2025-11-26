import 'dart:async';

import 'package:bd_app_v0/src/features/settings/domain/user.dart';
import 'package:bd_app_v0/src/features/settings/state/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends AsyncNotifier<User> {
  @override
  FutureOr<User> build() async {
    final userRepo = await ref.watch(userRepositoryProvider.future);
    return userRepo.loadUser();
  }

  Future<void> updateName(String name) async {
    final userRepo = await ref.read(userRepositoryProvider.future);
    final user = state.value;
    if (user != null) {
      final newUserName = user.copyWith(name: name);
      state = AsyncData(newUserName);
      await userRepo.saveUser(newUserName);
    } else {
      throw Exception('Kein User gefunden');
    }
  }
}
