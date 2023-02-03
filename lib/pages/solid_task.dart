import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [SolidTask] is a `StatefulWidget` that displays a random color
/// background and a "Hi there" text in the center. The text color
/// changes based on the brightness of the background color. The user
/// can tap anywhere on the screen to generate a new random background color.
class SolidTask extends StatefulWidget {
  /// Creates a new instance of [SolidTask].
  const SolidTask({super.key});

  @override
  State<SolidTask> createState() => _SolidTaskState();
}

class _SolidTaskState extends State<SolidTask> {
  /// size for big font in the app
  double fontSizeBig = 10.w;

  /// size for regular font in the app
  double fontSizeRegular = 5.w;

  /// max possible value for any color
  int maxAmountColor = 255;

  /// background color that will be changed
  Color colorBackground = Colors.deepOrangeAccent;

  /// text color changed depending on the brightness of color
  Color textColor = Colors.black;

  ///make random value for RGB
  List<int> makeColor() {
    /// call for random to generate values
    final Random random = Random();
    final List<int> colors = [
      random.nextInt(maxAmountColor),
      random.nextInt(maxAmountColor),
      random.nextInt(maxAmountColor),
    ];

    return colors;
  }

  /// function to generate random background color
  void generateRandomBack() {
    setState(() {
      final List<int> colorValue = makeColor();

      /// setting random color
      colorBackground = Color.fromRGBO(
        colorValue.first,
        colorValue.elementAt(1),
        colorValue.last,
        1,
      );

      /// setting color of text depending on brightness
      ThemeData.estimateBrightnessForColor(colorBackground) == Brightness.dark
          ? textColor = Colors.white
          : textColor = Colors.black;
    });
  }

  ///function to generate random text color
  void generateRandomText() {
    setState(() {
      final List<int> colorValue = makeColor();
      textColor = Color.fromRGBO(
        colorValue.first,
        colorValue.elementAt(1),
        colorValue.last,
        1,
      );
    });
  }

  /// init state launches with app
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// gesture detector catches if you press on any point of the screen.
    return GestureDetector(
      onTap: generateRandomBack,
      onDoubleTap: generateRandomText,
      child: Scaffold(
        backgroundColor: colorBackground,
        appBar: null,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi there",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSizeBig,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Tap on the screen once or twice to see magic",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSizeRegular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
