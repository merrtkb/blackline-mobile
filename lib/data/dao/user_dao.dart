import '../../models/user.dart';
import '../database/database_helper.dart';

class UserDao {
  Future<int> insertUser(User user) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert('users', user.toMap());
  }

  Future<User?> login(String email, String password) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }

    return null;
  }

  Future<int> changePassword(String email, String newPassword) async {
    final db = await DatabaseHelper.instance.database;

    return await db.update(
      'users',
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}
