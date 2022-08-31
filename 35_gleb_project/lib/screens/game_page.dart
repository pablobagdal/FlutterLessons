import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Игра")),
      body: GameWidget(),
    );
  }
}

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  // Map<String, String> players = {'fisrt': 'cross', 'second': 'circle'};

  /// increments with each step
  static int stepCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        // Create a grid with 3 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 9 widgets that display their index in the List.
        children: List.generate(9, (index) {
          return Center(
            child: CustomGestureDetector(),
          );
        }),
      ),
    );
  }
}

class CustomGestureDetector extends StatefulWidget {
  CustomGestureDetector({Key? key}) : super(key: key);

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  String? iconShape;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CrossCircleIcon(
        iconShape: iconShape,
      ),
      onTap: () {
        if (stepCounter % 2 == 1) {
          //first players turn
          setState(() {
            iconShape = 'cross';
          });
        } else {
          //second player turn
          setState(() {
            iconShape = 'circle';
          });
        }
        stepCounter++;
      },
    );
  }
}

class CrossCircleIcon extends StatefulWidget {
  String? iconShape;

  CrossCircleIcon({
    Key? key,
    String? iconShape,
  }) : super(key: key);

  @override
  State<CrossCircleIcon> createState() => _CrossCircleIconState();
}

class _CrossCircleIconState extends State<CrossCircleIcon> {
  @override
  Widget build(BuildContext context) {
    switch (widget.iconShape) {
      case 'circle':
        return Icon(
          Icons.circle_outlined,
          size: 50,
        );
      case 'cross':
        return Icon(
          Icons.close,
          size: 50,
        );
      default:
        return Container();
    }
  }
}
