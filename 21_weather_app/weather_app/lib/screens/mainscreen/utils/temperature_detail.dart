import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';

class TemperatureDetail extends StatefulWidget {
  const TemperatureDetail({Key? key}) : super(key: key);

  @override
  State<TemperatureDetail> createState() => _TemperatureDetailState();
}

class _TemperatureDetailState extends State<TemperatureDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sunny,
            color: foregroundColor,
            size: 70,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                "14 ˚F",
                style: TextStyle(
                    color: foregroundColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                "light snow".toUpperCase(),
                style: TextStyle(
                    color: foregroundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
