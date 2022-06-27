import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Listview example"),
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

ListView _myListView() {
  return ListView(
    // shrinkWrap: true,
    reverse: true,
    scrollDirection: Axis.horizontal,
    itemExtent: 300,
    padding: EdgeInsets.all(8.0),
    children: [
      ListTile(
        title: Text(
          "Sun",
        ),
        subtitle: Text(
          "Today's clear",
        ),
        leading: Icon(Icons.wb_sunny),
        trailing: IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(
          "Snow",
        ),
        subtitle: Text(
          "It was freezing",
        ),
        leading: Icon(Icons.snowing),
        trailing: IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(
          "Cloudy",
        ),
        subtitle: Text(
          "It was cold",
        ),
        leading: Icon(Icons.wb_cloudy),
        trailing: IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          onPressed: () {},
        ),
      ),
    ],
  );
}
