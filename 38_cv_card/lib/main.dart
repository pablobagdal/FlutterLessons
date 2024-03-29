import 'dart:async';

import 'package:cv_card/app_theme.dart';
import 'package:cv_card/conponents/card_container.dart';
import 'package:cv_card/conponents/link_icon.dart';
import 'package:cv_card/conponents/text.dart';
import 'package:cv_card/error_handler.dart';
import 'package:cv_card/logger.dart';
import 'package:cv_card/s.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'c_v_icons.dart';

const _tgAvatar = 'assets/ava.png';

class Links {
  static const github = "https://pablobagdal.github.io";
  static const telegram = "https://t.me/pablobagdal";
  static const email = "pablobagdal@gmail.com";
  // что за безымянная странная хуйня ниже пока не знаю
  const Links._();
}

void main() {
  runZonedGuarded(() {
    initLogger();
    logger.info('Start main');

    ErrorHandler.init();
    runApp(const App());
  }, ErrorHandler.recordError);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _isDark = false;
  var _locale = S.en;

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.supportedLocales,
        locale: _locale,
        builder: (context, child) => Material(
          child: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: IconButton(
                        onPressed: () {
                          final newMode = !_isDark;
                          logger.info('Switch theme mode: '
                              '${_isDark.asThemeName} -> ${newMode.asThemeName}');

                          setState(
                            () {
                              _isDark = newMode;
                            },
                          );
                        },
                        icon: Icon(
                          _isDark ? Icons.nightlight_round : Icons.sunny,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkResponse(
                        child: Text(_locale.languageCode.toUpperCase()),
                        onTap: () {
                          final newLocale = S.isEn(_locale) ? S.ru : S.en;
                          logger.info(
                            'Switch language: '
                            '${_locale.languageCode} -> ${newLocale.languageCode}',
                          );
                          setState(() => _locale = newLocale);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        theme: AppTheme.theme(_isDark),
        home: const HomePage(),
      );
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
          child: CVCard(),
        ),
      ),
    );
  }
}

class CVCard extends StatelessWidget {
  const CVCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CVCardContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: InfoWidget(),
          ),
          Flexible(
            flex: 2,
            child: AvatarWidget(),
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(
            12.0,
          ),
          child: IdentifyWidget(),
        ),
        LinksWidget(),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _tgAvatar,
      fit: BoxFit.fitHeight,
      frameBuilder: (_, child, frame, __) => AnimatedOpacity(
        opacity: frame == null ? 0 : 1.0,
        duration: const Duration(
          milliseconds: 1500,
        ),
        child: frame == null ? Container() : child,
      ),
    );
  }
}

class IdentifyWidget extends StatelessWidget {
  const IdentifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle(
          S.of(context).name,
        ),
        AppSubtitle(
          S.of(context).company,
        ),
      ],
    );
  }
}

class LinksWidget extends StatelessWidget {
  const LinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(
          flex: 1,
        ),
        Flexible(
          child: LinkIcon(
            icon: CVIcons.telegram,
            onPressed: () => launchUrl(
              Uri.parse(Links.telegram),
            ),
          ),
        ),
        Flexible(
          child: LinkIcon(
            icon: CVIcons.github,
            onPressed: () => launchUrl(
              Uri.parse(
                Links.github,
              ),
            ),
          ),
        ),
        Flexible(
          child: LinkIcon(
            icon: CVIcons.email,
            onPressed: () {
              Clipboard.setData(
                const ClipboardData(
                  text: Links.email,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: AppText(
                    S.of(context).copied,
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
    );
  }
}

extension _BoolToThemeName on bool {
  String get asThemeName => this ? 'dark' : 'light';
}
