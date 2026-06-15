import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

import '../../models/car.dart';
import '../dao/car_dao.dart';

class SeedData {
  static Future<void> insertCarsFromCsv() async {
    final dao = CarDao();

    final existingCars = await dao.getAllCars();

    if (existingCars.isNotEmpty) return;

    final rawData = await rootBundle.loadString('assets/cars.csv');

    List<List<dynamic>> rows =
        const CsvToListConverter().convert(rawData);

    rows.removeAt(0); // header

    for (var row in rows) {
      final car = Car(
        id: row[0].toString(),
        name: row[1].toString(),
        price: int.parse(row[2].toString()),
        image: row[3].toString(),
        power: row[4].toString(),
        acceleration: row[5].toString(),
        topSpeed: row[6].toString(),
        description: row[7].toString(),
        soundUrl: row[8].toString(),
        category: row[9].toString(),
        year: int.parse(row[10].toString()),
      );

      await dao.insertCar(car);
    }
  }
}