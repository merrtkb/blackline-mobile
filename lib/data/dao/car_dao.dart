import '../../models/car.dart';
import '../database/database_helper.dart';

class CarDao {
  Future<List<Car>> getAllCars() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('cars');

    return result.map((e) => Car.fromMap(e)).toList();
  }

  Future<int> insertCar(Car car) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert('cars', car.toMap());
  }

  Future<int> updateCar(Car car) async {
    final db = await DatabaseHelper.instance.database;

    return await db.update(
      'cars',
      car.toMap(),
      where: 'id = ?',
      whereArgs: [car.id],
    );
  }

  Future<int> deleteCar(String id) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete('cars', where: 'id = ?', whereArgs: [id]);
  }

  Future<Car> getCarById(String id) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('cars', where: 'id = ?', whereArgs: [id]);

    return Car.fromMap(result.first);
  }
}
