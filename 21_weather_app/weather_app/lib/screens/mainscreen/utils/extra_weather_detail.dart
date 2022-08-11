import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';

class ExtraWeatherDetail extends StatefulWidget {
  const ExtraWeatherDetail({Key? key}) : super(key: key);

  @override
  State<ExtraWeatherDetail> createState() => _ExtraWeatherDetailState();
}

class _ExtraWeatherDetailState extends State<ExtraWeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.sunny_snowing,
                color: foregroundColor,
                size: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "4\nkm/hr",
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.sunny_snowing,
                color: foregroundColor,
                size: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "4\nkm/hr",
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.sunny_snowing,
                color: foregroundColor,
                size: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "4\nkm/hr",
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
