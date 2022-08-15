import 'package:flutter/material.dart';
import 'package:form_widget/register_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RegisterFormPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterFormPage(),
    );
  }
}
