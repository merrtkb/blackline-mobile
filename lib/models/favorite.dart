class Favorite {
  final int? id;
  final String userEmail;
  final String carId;
  final String carName;
  final String image;

  Favorite({
    this.id,
    required this.userEmail,
    required this.carId,
    required this.carName,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userEmail': userEmail,
      'carId': carId,
      'carName': carName,
      'image': image,
    };
  }

  factory Favorite.fromMap(
    Map<String, dynamic> map,
  ) {
    return Favorite(
      id: map['id'],
      userEmail: map['userEmail'],
      carId: map['carId'],
      carName: map['carName'],
      image: map['image'],
    );
  }
}