import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'LobsterTwo'),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image test app"),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: AssetImage("lib/img/ggg1.png"),
              ),
              Image.asset("lib/img/ggg2.png"),
              Center(
                child: Text(
                  "Sample text",
                  style: TextStyle(color: Colors.amber, fontSize: 55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
