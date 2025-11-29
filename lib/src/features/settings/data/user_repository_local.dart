import 'dart:convert';

import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryLocal implements UserRepository {
  final SharedPreferences _preferences;
  final String _userId;

  UserRepositoryLocal({
    required SharedPreferences preferences,
    required String userId,
  }) : _preferences = preferences,
       _userId = userId;

  String get _userProfileKey => 'users_${_userId}_profile';

  @override
  Future<UserProfile> loadUser() async {
    final userString = _preferences.getString(_userProfileKey);

    if (userString != null) {
      return UserProfile.fromJson(jsonDecode(userString));
    } else {
      throw Exception('No user found in local storage.');
    }
  }

  @override
  Future<void> saveUser(UserProfile user) async {
    final userString = jsonEncode(user.toJson());
    await _preferences.setString(_userProfileKey, userString);
  }
}
