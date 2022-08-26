import 'package:autogen_serialization/screens/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter JSON Demo',
      home: HomePage(),
    );
  }
}
