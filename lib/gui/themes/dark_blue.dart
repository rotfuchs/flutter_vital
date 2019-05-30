import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/theme_builder.dart';

class DarkBlueTheme extends AppTheme {
  static const blackPrimaryValue = 0xFF000000;
  static const backgroundColor = const Color(0xFF191919);
  static const primaryButtonBackgroundColor = const Color(0xFF84b5fa); //200
  static const cardBackgroundColor = const Color(0xFF313131);
  static const snackBarBackgroundColor = Colors.green;

  static const MaterialColor colors = const MaterialColor(
    blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFFe6f0fe),
      100: const Color(0xFFb5d3fc),
      200: const Color(0xFF84b5fa),
      300: const Color(0xFF5398f9),
      400: const Color(0xFF227bf7),
      500: const Color(0xFF0861dd),
      600: const Color(0xFF064cac),
      700: const Color(0xFF064cac),
      800: const Color(0xFF03204a),
      900: const Color(0xFF010b19),
    },
  );

  ThemeData getThemeData() {
    return new ThemeData(
      brightness: Brightness.dark,
      primarySwatch: colors,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardBackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors[200]
      ),
      toggleableActiveColor: colors[400],
    );
  }
}