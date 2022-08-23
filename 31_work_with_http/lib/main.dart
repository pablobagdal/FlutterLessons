import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // void func() {return 5;} same as void func() => 5;
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP test"),
      ),
      body: Container(
          child: Column(
        children: [
          Text("Hello"),
        ],
      )),
    );
  }

  Future<http.Response> getData() async {
    const url = 'https://about.google/static/data/locations.json';
    return await http.get(Uri.parse(url));
  }

  void loadData() {
    getData().then((response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
