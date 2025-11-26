import 'dart:convert';

import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryLocal implements UserRepository {
  final SharedPreferences _preferences;

  UserRepositoryLocal({required SharedPreferences preferences})
    : _preferences = preferences;

  static const _kUserKey = 'user-profile';

  @override
  Future<UserProfile> loadUser() async {
    final userString = _preferences.getString(_kUserKey);

    if (userString != null) {
      return UserProfile.fromJson(jsonDecode(userString));
    } else {
      throw Exception('No user found in local storage.');
    }
  }

  @override
  Future<void> saveUser(UserProfile user) async {
    final userString = jsonEncode(user.toJson());
    await _preferences.setString(_kUserKey, userString);
  }
}
