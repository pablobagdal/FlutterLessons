import 'package:flutter/material.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/screens/mainscreen/main_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
