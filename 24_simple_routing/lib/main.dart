/// передача данных через конструктор

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstHome(),
    );
  }
}

class FirstHome extends StatelessWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstHome"),
      ),
      body: Container(
          child: TextButton(
        onPressed: () {
          User mainUser = User(age: 23, name: "Pavel");
          Route route = MaterialPageRoute(
              builder: ((context) => SecondHome(
                    user: mainUser,
                  )));
          Navigator.push(context, route);
        },
        child: Text("to the SecondHome"),
      )),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  const SecondHome({Key? key, required User this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.info(),
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User({required this.name, required this.age});

  String info() {
    return "name: $name, age: $age";
  }
}
