import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTitle extends StatelessWidget {
  static const fontSize = 28.0;

  const AppTitle(
    this.value, {
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AppSubtitle extends StatelessWidget {
  static const fontSize = 18.0;

  const AppSubtitle(
    this.value, {
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  static const fontSize = 14.0;

  const AppText(
    this.value, {
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
