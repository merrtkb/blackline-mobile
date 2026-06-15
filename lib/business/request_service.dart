import '../data/repositories/request_repository.dart';
import '../models/vehicle_request.dart';

class RequestService {
  final RequestRepository _repository = RequestRepository();

  Future<int> addRequest(VehicleRequest request) {
    return _repository.addRequest(request);
  }

  Future<List<VehicleRequest>> getRequests() {
    return _repository.getRequests();
  }

  Future<int> deleteRequest(int id) {
    return _repository.deleteRequest(id);
  }
}