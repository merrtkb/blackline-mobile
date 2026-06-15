import '../../models/car.dart';
import '../dao/car_dao.dart';

class CarRepository {
  final CarDao _dao = CarDao();

  Future<List<Car>> getCars() {
    return _dao.getAllCars();
  }

  Future<int> addCar(Car car) {
    return _dao.insertCar(car);
  }

  Future<int> updateCar(Car car) {
    return _dao.updateCar(car);
  }

  Future<int> deleteCar(String id) {
    return _dao.deleteCar(id);
  }
  Future<Car> getCarById(String id) {
  return _dao.getCarById(id);
}
}