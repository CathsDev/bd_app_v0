import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> loadUser();
  Future<void> saveUser(UserProfile user);
}
