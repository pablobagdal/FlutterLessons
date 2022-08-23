import 'dart:convert';

import 'package:http/http.dart' as http;

class Office {
  final String name;
  final String address;
  final String image;

  Office({required this.address, required this.image, required this.name});

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      address: json['address'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
