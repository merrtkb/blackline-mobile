import '../data/repositories/user_repository.dart';
import '../models/user.dart';

class AuthService {
  final UserRepository _repository = UserRepository();

  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final user = User(fullName: fullName, email: email, password: password);

    await _repository.register(user);

    return true;
  }

  Future<User?> login({required String email, required String password}) async {
    return await _repository.login(email, password);
  }

  Future<int> changePassword({
    required String email,
    required String newPassword,
  }) {
    return _repository.changePassword(email, newPassword);
  }
}
