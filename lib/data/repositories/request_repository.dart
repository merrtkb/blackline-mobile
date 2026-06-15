import '../../models/vehicle_request.dart';
import '../dao/request_dao.dart';

class RequestRepository {
  final RequestDao _dao = RequestDao();

  Future<int> addRequest(VehicleRequest request) {
    return _dao.insertRequest(request);
  }

  Future<List<VehicleRequest>> getRequests() {
    return _dao.getRequests();
  }

  Future<int> deleteRequest(int id) {
    return _dao.deleteRequest(id);
  }
}