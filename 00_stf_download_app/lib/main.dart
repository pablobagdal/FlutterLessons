import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDownloading;
  late double _downloadProgress;

  @override
  void initState() {
    // TODO: implement initState
    _isDownloading = false;
    _downloadProgress = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text('My First App'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: _isDownloading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(value: _downloadProgress),
                      Text(
                        '${(_downloadProgress * 100).round()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                : const Text(
                    'Text button to download',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isDownloading = !_isDownloading;
              _updateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(milliseconds: 20);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _downloadProgress += 0.01;
        if (_downloadProgress.toStringAsFixed(1) == '1.0') {
          _isDownloading = false;
          t.cancel();
          _downloadProgress = 0.0;
          return;
        }
      });
    });
  }
}
