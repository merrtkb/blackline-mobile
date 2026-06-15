import '../../models/vehicle_request.dart';
import '../database/database_helper.dart';

class RequestDao {
  Future<int> insertRequest(VehicleRequest request) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert(
      'requests',
      request.toMap(),
    );
  }

  Future<List<VehicleRequest>> getRequests() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('requests');

    return result.map((e) => VehicleRequest.fromMap(e)).toList();
  }

  Future<int> deleteRequest(int id) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete(
      'requests',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}