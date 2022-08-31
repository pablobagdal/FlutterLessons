/// used for logging in debug console or DevTools Logging (cmd+shift+p then dev tools then logging)
// import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// https://http.cat/

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? text;
  String? imageUrl;
  bool isCached = false;
  Dio dio = Dio();
  late InterceptorsWrapper cacheInterceptor;

  @override
  void initState() {
    /// подключаем перехватчик для логирования
    dio.interceptors.add(LogInterceptor());

    // dio.options.baseUrl = 'https://dog-api.kinduff.com';

    cacheInterceptor = InterceptorsWrapper(
      onRequest: ((options, handler) {
        print('cache interceptor');
      }),
      onResponse: (e, handler) {},
    );
    dio.interceptors.add(cacheInterceptor);

    // cacheInterceptor = InterceptorsWrapper(
    //   onRequest: (options) {
    //     return dio.resolve({ 'text': 'Cats are awesome!' });
    //   },
    //   onResponse: (response) {
    //     return response;
    //   }
    // );
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));
    // dio.options.baseUrl = 'https://cat-fact.herokuapp.com/facts';
    super.initState();
  }

  void _sendRequest() async {
    try {
      Response response =
          await dio.get('https://dog-api.kinduff.com/api/facts');
      setState(() {
        text = response.data['facts'][0] as String;
        imageUrl = 'https://http.cat/${response.statusCode}';
        // developer.log(response.toString(), name: 'response');
      });
    } catch (error) {
      DioError dioError = error as DioError;

      setState(() {
        text = dioError.message;
        dioError.response?.statusCode == null
            ? imageUrl = null
            : imageUrl = 'https://http.cat/${dioError.response?.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            imageUrl == null
                ? Text(
                    "No image",
                    textAlign: TextAlign.center,
                  )
                : Image.network(imageUrl!),
            Text(
              text ?? "no text yet",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: _sendRequest,
              child: Text('update fact'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('enable cache'),
                Switch(
                    value: isCached,
                    onChanged: (value) {
                      setState(() {
                        isCached = value;
                        if (isCached) {
                          // dio.interceptors.add(cacheInterceptor);
                        } else {
                          // dio.interceptors.remove(cacheInterceptor);
                        }
                      });
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
