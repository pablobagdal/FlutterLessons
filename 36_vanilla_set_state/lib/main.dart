import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Set State Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double size = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Push stars to change rating:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                  icon: _rating >= 1
                      ? Icon(
                          Icons.star,
                          size: size,
                        )
                      : Icon(
                          Icons.star_border,
                          size: size,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                  icon: _rating >= 2
                      ? Icon(
                          Icons.star,
                          size: size,
                        )
                      : Icon(
                          Icons.star_border,
                          size: size,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                  icon: _rating >= 3
                      ? Icon(
                          Icons.star,
                          size: size,
                        )
                      : Icon(
                          Icons.star_border,
                          size: size,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
