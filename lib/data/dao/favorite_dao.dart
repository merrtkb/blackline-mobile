import '../../models/favorite.dart';
import '../database/database_helper.dart';

class FavoriteDao {
  Future<List<Favorite>> getFavorites(String email) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'favorites',
      where: 'userEmail = ?',
      whereArgs: [email],
    );

    return result.map((e) => Favorite.fromMap(e)).toList();
  }

  Future<bool> toggleFavorite(Favorite favorite) async {
    final db = await DatabaseHelper.instance.database;

    final existing = await db.query(
      'favorites',
      where: 'userEmail = ? AND carId = ?',
      whereArgs: [
        favorite.userEmail,
        favorite.carId,
      ],
    );

    if (existing.isNotEmpty) {
      await db.delete(
        'favorites',
        where: 'userEmail = ? AND carId = ?',
        whereArgs: [
          favorite.userEmail,
          favorite.carId,
        ],
      );

      return false;
    }

    await db.insert(
      'favorites',
      favorite.toMap(),
    );

    return true;
  }
}