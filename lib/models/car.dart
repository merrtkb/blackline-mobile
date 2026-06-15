class Car {
  final String id;
  final String name;
  final int price;
  final String image;
  final String power;
  final String acceleration;
  final String topSpeed;
  final String description;
  final String soundUrl;
  final String category;
  final int year;

  Car({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.power,
    required this.acceleration,
    required this.topSpeed,
    required this.description,
    required this.soundUrl,
    required this.category,
    required this.year,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"] ?? 0,
      image: json["image"]?.toString() ?? "",
      power: json["power"]?.toString() ?? "",
      acceleration: json["acceleration"]?.toString() ?? "",
      topSpeed: json["topSpeed"]?.toString() ?? "",
      description: json["description"]?.toString() ?? "",
      soundUrl: json["soundUrl"]?.toString() ?? "",
      category: json["category"]?.toString() ?? "",
      year: json["year"] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'power': power,
      'acceleration': acceleration,
      'topSpeed': topSpeed,
      'description': description,
      'soundUrl': soundUrl,
      'category': category,
      'year': year,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'].toString(),
      name: map['name'],
      price: map['price'],
      image: map['image'],
      power: map['power'],
      acceleration: map['acceleration'],
      topSpeed: map['topSpeed'],
      description: map['description'],
      soundUrl: map['soundUrl'],
      category: map['category'],
      year: map['year'],
    );
  }
}
