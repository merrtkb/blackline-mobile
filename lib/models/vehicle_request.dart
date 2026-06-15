class VehicleRequest {
  final int? id;
  final String userEmail;
  final String carId;
  final String carName;
  final String phone;
  final String message;
  final String status;

  VehicleRequest({
    this.id,
    required this.userEmail,
    required this.carId,
    required this.carName,
    required this.phone,
    required this.message,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userEmail': userEmail,
      'carId': carId,
      'carName': carName,
      'phone': phone,
      'message': message,
      'status': status,
    };
  }

  factory VehicleRequest.fromMap(Map<String, dynamic> map) {
    return VehicleRequest(
      id: map['id'],
      userEmail: map['userEmail'],
      carId: map['carId'],
      carName: map['carName'],
      phone: map['phone'],
      message: map['message'],
      status: map['status'],
    );
  }
}