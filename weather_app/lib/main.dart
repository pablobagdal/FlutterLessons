import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          backgroundColor: Colors.amber,
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: _buildBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(child: _headerImage()),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    fit: BoxFit.cover,
    image: NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGT0oFUEgXsO49POVbXjDwXrlvzUBRs0yoNA&usqp=CAU"),
  );
}

Column _weatherDescription() {
  return Column(
    children: [
      Text(
        "Tuesday - May 22",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        "This is the weather on the tuesday of May 22nd this year. This is just some text:)",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),
      ),
    ],
  );
}

Widget _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.amber,
            size: 40,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "15˚ clear",
                style: TextStyle(color: Colors.deepPurple, fontSize: 24),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Tomskaya obl., Tomsk",
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
            ],
          )
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(8, (int index) {
      return Chip(
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        label: Text(
          "${index + 20}˚C",
          style: TextStyle(fontSize: 15.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15.0,
      ),
      Icon(
        Icons.star,
        color: Colors.grey.shade300,
        size: 15.0,
      ),
      Icon(
        Icons.star,
        color: Colors.grey.shade300,
        size: 15.0,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        "Info with mac.com",
        style: TextStyle(fontSize: 20),
      ),
      stars,
    ],
  );
}
