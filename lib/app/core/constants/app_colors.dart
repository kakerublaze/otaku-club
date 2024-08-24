import 'package:flutter/material.dart';
import 'package:otakuclub/app/core/utils/helpers/color_helper.dart';

class AppColor {
  ///--> Normal
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color transparent = Colors.transparent;
  static const Color yellow = Colors.yellow;
  static const Color green = Colors.green;
  static const Color pink = Colors.pink;
  static const Color purple = Colors.purple;
  static const Color deepPurple = Colors.deepPurple;
  static const Color amber = Colors.amber;
  static const Color brown = Colors.brown;
  static const Color cyan = Colors.cyan;
  static const Color deepOrange = Colors.deepOrange;
  static const Color orange = Colors.orange;
  static const Color grey = Colors.grey;
  static const Color indigo = Colors.indigo;
  static const Color lightBlue = Colors.lightBlue;
  static const Color lightGreen = Colors.lightGreen;
  static const Color lime = Colors.lime;
  static const Color teal = Colors.teal;
  static const Color blueGrey = Colors.blueGrey;

  ///--> Accents
  static const Color redAccent = Colors.redAccent;
  static const Color blueAccent = Colors.blueAccent;
  static const Color cyanAccent = Colors.cyanAccent;
  static const Color limeAccent = Colors.limeAccent;
  static const Color pinkAccent = Colors.pinkAccent;
  static const Color tealAccent = Colors.tealAccent;
  static const Color greenAccent = Colors.greenAccent;
  static const Color amberAccent = Colors.amberAccent;
  static const Color indigoAccent = Colors.indigoAccent;
  static const Color orangeAccent = Colors.orangeAccent;
  static const Color purpleAccent = Colors.purpleAccent;
  static const Color yellowAccent = Colors.yellowAccent;
  static const Color lightBlueAccent = Colors.lightBlueAccent;
  static const Color deepOrangeAccent = Colors.deepOrangeAccent;
  static const Color deepPurpleAccent = Colors.deepPurpleAccent;
  static const Color lightGreenAccent = Colors.lightGreenAccent;

  ///--> Lightness Shades
  static const Color black12 = Colors.black12;
  static const Color black26 = Colors.black26;
  static const Color black38 = Colors.black38;
  static const Color black45 = Colors.black45;
  static const Color black54 = Colors.black54;
  static const Color black87 = Colors.black87;
  static const Color white10 = Colors.white10;
  static const Color white12 = Colors.white12;
  static const Color white24 = Colors.white24;
  static const Color white30 = Colors.white30;
  static const Color white38 = Colors.white38;
  static const Color white54 = Colors.white54;
  static const Color white60 = Colors.white60;
  static const Color white70 = Colors.white70;

  ///--> Shades
  static Color grey100 = Colors.grey.shade100;
  static Color grey200 = Colors.grey.shade200;
  static Color grey300 = Colors.grey.shade300;
  static Color grey400 = Colors.grey.shade400;
  static Color grey500 = Colors.grey.shade500;
  static Color grey600 = Colors.grey.shade600;
  static Color grey700 = Colors.grey.shade700;
  static Color grey800 = Colors.grey.shade800;
  static Color grey900 = Colors.grey.shade900;

  // Splash Screen Colors
  static HexColor darkBlackSplashScreen = HexColor('#000000');
  static HexColor ligthBlackSplashScreen = HexColor('#28313B');
  static HexColor ligthGreySplashScreen = HexColor('#485461');
  static HexColor darkGreySplashScreen = HexColor('#2C3E50');
  static LinearGradient splashScreenColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.3, 0.7],
    colors: [
      // darkGreySplashScreen,
      ligthBlackSplashScreen,
      ligthGreySplashScreen,
      // darkBlackSplashScreen,
    ],
  );

  /// --> Get Started Colors
  static LinearGradient getStartedGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.transparent, // Start fading to transparent
      AppColor.black, // Bottom: Blackish with opacity
    ],
    stops: [0.0, 0.9],
  );
}
