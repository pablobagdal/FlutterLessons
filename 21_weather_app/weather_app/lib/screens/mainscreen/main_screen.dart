import 'package:flutter/material.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/screens/mainscreen/utils/bottom_detail.dart';
import 'package:weather_app/screens/mainscreen/utils/city_detail.dart';
import 'package:weather_app/screens/mainscreen/utils/extra_weather_detail.dart';
import 'package:weather_app/screens/mainscreen/utils/temperature_detail.dart';
import 'package:weather_app/screens/mainscreen/utils/text_field_city_search.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0, // this is bottom shadow
        centerTitle: true,
        title: Text(
          appBarText,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldCitySearch(),
              CityDetail(),
              TemperatureDetail(),
              ExtraWeatherDetail(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  bottomDetailText,
                  style: TextStyle(
                    color: foregroundColor,
                  ),
                ),
              ),
              BottomDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
