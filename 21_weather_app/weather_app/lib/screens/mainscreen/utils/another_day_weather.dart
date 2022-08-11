import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';

class AnotherDayWeather extends StatefulWidget {
  final String dayOfWeek;
  final int degrees;
  final Icon weatherIcon;

  const AnotherDayWeather(@required this.dayOfWeek, @required this.degrees,
      @required this.weatherIcon,
      {Key? key})
      : super(key: key);

  @override
  State<AnotherDayWeather> createState() => _AnotherDayWeatherState();
}

class _AnotherDayWeatherState extends State<AnotherDayWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white38),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.dayOfWeek,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 25,
            ),
          ),
          Row(
            children: [
              Text(
                "${widget.degrees} ˚F",
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 20,
                ),
              ),
              widget.weatherIcon,
            ],
          ),
        ],
      ),
    );
  }
}
