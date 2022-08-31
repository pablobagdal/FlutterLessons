import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'office.g.dart';

@JsonSerializable()
class Office {
  // @JsonKey(name: 'dt') // dt
  // DateTime dateTime;
  final String name;
  final String address;
  final String image;

  Office({required this.name, required this.address, required this.image});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
