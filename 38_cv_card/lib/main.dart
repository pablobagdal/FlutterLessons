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

class CVCardContainer extends StatelessWidget {
  static const _borderRadius = 16.0;
  final Widget child;

  const CVCardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
          child: child,
        ),
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
        const Text(
          "Павел Багдалов",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        const Text(
          "Работаю на себя",
          style: TextStyle(
            fontSize: 18,
          ),
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
    );
  }
}

class LinkIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LinkIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
