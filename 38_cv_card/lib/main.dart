import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'c_v_icons_icons.dart';

const _tgAvatar = 'assets/ava.png';

class Links {
  static const github = "https://pablobagdal.github.io";
  static const telegram = "https://t.me/pablobagdal";
  static const email = "pablobagdal@gmail.com";
  // что за безымянная странная хуйня ниже пока не знаю
  const Links._();
}

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(
            10.0,
          ),
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  26.0,
                ),
              ),
              elevation: 18.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  26.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                              12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Павел Багдалов",
                                  style: TextStyle(
                                    fontSize: 28,
                                  ),
                                ),
                                Text(
                                  "Работаю на себя",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Spacer(
                                flex: 1,
                              ),
                              Flexible(
                                child: IconButton(
                                  iconSize: 32,
                                  icon: const Icon(
                                    CVIcons.telegram,
                                  ),
                                  onPressed: () => launchUrl(
                                    Uri.parse(
                                      Links.telegram,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  iconSize: 32,
                                  icon: const Icon(
                                    CVIcons.github,
                                  ),
                                  onPressed: () => launchUrl(
                                    Uri.parse(
                                      Links.github,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  iconSize: 32,
                                  icon: const Icon(
                                    CVIcons.email,
                                  ),
                                  onPressed: () {
                                    // launchUrl(
                                    //   Uri.parse(
                                    //     Links.email,
                                    //   ),
                                    // );
                                    Clipboard.setData(
                                      const ClipboardData(
                                        text: Links.email,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Скопировано",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Image.asset(
                        _tgAvatar,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
