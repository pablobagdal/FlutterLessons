import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const FirstHome(),
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => FirstHome());
        case '/second':
          User user = User(name: "Pavel", age: 23);
          return MaterialPageRoute(
            builder: (context) => SecondHome(
              user: user,
            ),
          );
      }
    },
  ));
}

class FirstHome extends StatelessWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: 'Konstantin', age: 34);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;
  const SecondHome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} - ${user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
