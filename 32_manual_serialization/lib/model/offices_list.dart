import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manual_serialization/model/office.dart';

class OfficesList {
  final offices;

  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    List officesJson = json['offices'];

    List<Office> officesList =
        officesJson.map((index) => Office.fromJson(index)).toList();

    return OfficesList(offices: officesList);
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
