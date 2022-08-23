import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      routes: {
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
              Text(text ?? "No text yet"),
              TextButton(
                onPressed: () {
                  _returnDataFromSecondScreen(context);
                },
                child: Text("To the second screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _returnDataFromSecondScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/second');

    // setState
    setState(() {
      text = result as String;
    });
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("second"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            TextButton(
              onPressed: () {
                String textToSendBack = textEditingController.text;
                Navigator.pop(context, textToSendBack);
              },
              child: Text("Send text back"),
            ),
          ],
        ),
      ),
    );
  }
}
