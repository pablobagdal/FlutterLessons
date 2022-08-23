class Office {
  final String name;
  final String address;
  final String image;

  Office({required this.name, required this.address, required this.image});

  //фабричный конструктор fromJson
  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
    );
  }
}
