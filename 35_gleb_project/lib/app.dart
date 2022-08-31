import 'package:flutter/material.dart';
import 'package:gleb_project/screens/about_page.dart';
import 'package:gleb_project/screens/game_page.dart';
import 'package:gleb_project/screens/rules_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Игра крестики - нолики'),
        initialRoute: '/', // так и есть по-умолчанию
        routes: {
          // '/page1': (context) => MyHomePage(
          //       title: "some title",
          //     ),
          '/game': (context) => GamePage(),
          '/rules': (context) => RulesPage(),
          '/about': (context) => AboutPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Text("Играть")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/rules');
                },
                child: Text("Правила")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text("О нас")),
          ],
        ),
      ),
    );
  }
}
