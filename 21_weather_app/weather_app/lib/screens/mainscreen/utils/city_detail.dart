import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';

class CityDetail extends StatefulWidget {
  const CityDetail({Key? key}) : super(key: key);

  @override
  State<CityDetail> createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "${regionName}, ${countryName}\n",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w200,
          ),
          children: const [
            TextSpan(
              text: "${currentDate}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
