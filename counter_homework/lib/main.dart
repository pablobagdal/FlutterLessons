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
          backgroundColor: Colors.indigo[400],
          appBar: AppBar(
            title: Text("Counter"),
            backgroundColor: Colors.indigo,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tap \"-\" to decrement",
                  style: TextStyle(color: Colors.white),
                ),
                CounterWidget(),
                Text(
                  "Tap \"+\" to increment",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 666;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 170.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.indigo[50],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(
            "$_counter",
            style: TextStyle(fontSize: 30),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
