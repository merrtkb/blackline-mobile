import '../data/repositories/car_repository.dart';
import '../models/car.dart';

class CarService {
  final CarRepository _repository = CarRepository();

  Future<List<Car>> getCars() async {
    return await _repository.getCars();
  }
  Future<Car> getCarById(String id) async {
  return await _repository.getCarById(id);
}
}