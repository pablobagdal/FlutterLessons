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
  final List<String> items = List<String>.generate(10000, (i) => "Item #$i");

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(
            items[index],
          ),
          leading: Icon(Icons.abc),
          trailing: Icon(Icons.abc),
        ),
      );
    },
  );
}
