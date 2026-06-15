import '../../models/user.dart';
import '../dao/user_dao.dart';

class UserRepository {
  final UserDao _userDao = UserDao();

  Future<int> register(User user) {
    return _userDao.insertUser(user);
  }

  Future<User?> login(String email, String password) {
    return _userDao.login(email, password);
  }

  Future<int> changePassword(String email, String newPassword) {
    return _userDao.changePassword(email, newPassword);
  }
}
