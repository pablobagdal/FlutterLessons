import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';

class TextFieldCitySearch extends StatefulWidget {
  const TextFieldCitySearch({Key? key}) : super(key: key);

  @override
  State<TextFieldCitySearch> createState() => _TextFieldCitySearchState();
}

class _TextFieldCitySearchState extends State<TextFieldCitySearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        backgroundColor: backgroundColor,
        color: foregroundColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
          color: foregroundColor,
        ),
        hintText: enterCityName,
        hintStyle: TextStyle(
          color: foregroundColor,
        ),
      ),
    );
  }
}
