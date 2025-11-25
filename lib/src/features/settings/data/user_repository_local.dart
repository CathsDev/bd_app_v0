import 'dart:convert';

import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryLocal implements UserRepository {
  final SharedPreferences _preferences;

  UserRepositoryLocal({required SharedPreferences preferences})
    : _preferences = preferences;

  static const _kUserKey = 'user-profile';

  @override
  Future<User> loadUser() async {
    final userString = _preferences.getString(_kUserKey);

    if (userString != null) {
      return User.fromJson(jsonDecode(userString));
    } else {
      throw Exception('No user found in local storage.');
    }
  }

  @override
  Future<void> saveUser(User user) async {
    final userString = jsonEncode(user.toJson());
    await _preferences.setString(_kUserKey, userString);
  }
}
