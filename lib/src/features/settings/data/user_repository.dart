import 'package:bd_app_v0/src/features/settings/domain/user.dart';

abstract class UserRepository {
  Future<User> loadUser();
  Future<void> saveUser(User user);
}
