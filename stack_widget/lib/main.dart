import 'package:flutter/material.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded widget test"),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber,
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Positioned(
                      // left: 100,
                      // top: -20,
                      child: Icon(
                        Icons.airplay,
                        size: 50,
                      ),
                      // width: 0,
                      // height: 0,
                    ),
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Text("2"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber[100],
                child: Text("3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
