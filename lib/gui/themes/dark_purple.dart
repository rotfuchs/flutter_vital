import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/theme_builder.dart';

class DarkPurpleTheme extends AppTheme {
  static const blackPrimaryValue = 0xFF000000;
  static const backgroundColor = const Color(0xFF191919);
  static const primaryButtonBackgroundColor = const Color(0xFFBD83F8); //200
  static const cardBackgroundColor = const Color(0xFF313131);
  static const snackBarBackgroundColor = Colors.green;

  static const MaterialColor colors = const MaterialColor(
    blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFFF2E6FD),
      100: const Color(0xFFDDB0FC),
      200: const Color(0xFFBD83F8),
      300: const Color(0xFF9B5CFA),
      400: const Color(0xFF8237F6),
      500: const Color(0xFF6600E8),
      600: const Color(0xFF5B00E2),
      700: const Color(0xFF3D00AE),
      800: const Color(0xFF360097),
      900: const Color(0xFF2A0067),
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