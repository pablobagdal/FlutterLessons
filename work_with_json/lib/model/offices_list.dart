import 'dart:convert';

import 'package:work_with_json/model/office.dart';
import 'package:http/http.dart' as http;

class OfficesList {
  List<Office> offices;

  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;

    List<Office> officesList =
        officesJson.map((index) => Office.fromJson(index)).toList();

    return OfficesList(offices: json['offices']);
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
