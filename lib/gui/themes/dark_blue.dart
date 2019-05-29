import 'package:flutter/material.dart';

final ThemeData darkBlueTheme = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: DarkBlueThemeColors.purple,
  backgroundColor: DarkBlueThemeColors.backgroundColor,
  scaffoldBackgroundColor: DarkBlueThemeColors.backgroundColor,
  cardColor: DarkBlueThemeColors.cardBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: DarkBlueThemeColors.purple[200]
  ),
  toggleableActiveColor: DarkBlueThemeColors.purple[400],
);

class DarkBlueThemeColors extends ThemeColors{
  static const _blackPrimaryValue = 0xFF000000;
  static const backgroundColor = const Color(0xFF191919);
  static const primaryButtonBackgroundColor = 0xFFBD83F8;
  static const cardBackgroundColor = const Color(0xFF313131);
  static const snackBarBackgroundColor = Colors.green;

  static const MaterialColor purple = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFFF2E6FD),
      100: const Color(0xFFDDB0FC),
      200: const Color(primaryButtonBackgroundColor),
      300: const Color(0xFF9B5CFA),
      400: const Color(0xFF8237F6),
      500: const Color(0xFF6600E8),
      600: const Color(0xFF5B00E2),
      700: const Color(0xFF3D00AE),
      800: const Color(0xFF360097),
      900: const Color(0xFF2A0067),
    },
  );
}

class ThemeColors {
  static const _blackPrimaryValue = 0xFF000000;
  static const primaryButtonBackgroundColor = 0xFFBD83F8;
  static const MaterialColor purple = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFFF2E6FD),
      100: const Color(0xFFDDB0FC),
      200: const Color(primaryButtonBackgroundColor),
      300: const Color(0xFF9B5CFA),
      400: const Color(0xFF8237F6),
      500: const Color(0xFF6600E8),
      600: const Color(0xFF5B00E2),
      700: const Color(0xFF3D00AE),
      800: const Color(0xFF360097),
      900: const Color(0xFF2A0067),
    },
  );
}