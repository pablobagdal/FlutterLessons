import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CVCardContainer extends StatelessWidget {
  static const _borderRadius = 16.0;
  final Widget child;

  const CVCardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 8.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: child,
        ),
      ),
    );
  }
}
