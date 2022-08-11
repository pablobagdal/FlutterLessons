import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/screens/mainscreen/utils/another_day_weather.dart';

class BottomDetail extends StatefulWidget {
  const BottomDetail({Key? key}) : super(key: key);

  @override
  State<BottomDetail> createState() => _BottomDetailState();
}

class _BottomDetailState extends State<BottomDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AnotherDayWeather("Saturday", 6,
              Icon(Icons.sunny, color: foregroundColor, size: 30)),
          AnotherDayWeather("Sunday", 16,
              Icon(Icons.sunny_snowing, color: foregroundColor, size: 30)),
          AnotherDayWeather("Monday", 26,
              Icon(Icons.foggy, color: foregroundColor, size: 30)),
          AnotherDayWeather("Tuesday", 16,
              Icon(Icons.sunny, color: foregroundColor, size: 30)),
          AnotherDayWeather("Wednesday", 26,
              Icon(Icons.sunny, color: foregroundColor, size: 30)),
        ],
      ),
    );
  }
}

// class BodyListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _myListView();
//   }
// }

// ListView _myListView() {
//   return ListView(
//     // shrinkWrap: true,
//     // reverse: true,
//     scrollDirection: Axis.horizontal,
//     // itemExtent: 300,
//     // padding: EdgeInsets.all(8.0),
//     children: [
//       ListTile(
//         title: Text(
//           "Sun",
//         ),
//         subtitle: Text(
//           "Today's clear",
//         ),
//         leading: Icon(Icons.wb_sunny),
//         trailing: IconButton(
//           icon: Icon(Icons.keyboard_arrow_right),
//           onPressed: () {},
//         ),
//       ),
//       ListTile(
//         title: Text(
//           "Snow",
//         ),
//         subtitle: Text(
//           "It was freezing",
//         ),
//         leading: Icon(Icons.snowing),
//         trailing: IconButton(
//           icon: Icon(Icons.keyboard_arrow_right),
//           onPressed: () {},
//         ),
//       ),
//       ListTile(
//         title: Text(
//           "Cloudy",
//         ),
//         subtitle: Text(
//           "It was cold",
//         ),
//         leading: Icon(Icons.wb_cloudy),
//         trailing: IconButton(
//           icon: Icon(Icons.keyboard_arrow_right),
//           onPressed: () {},
//         ),
//       ),
//     ],
//   );
// }
