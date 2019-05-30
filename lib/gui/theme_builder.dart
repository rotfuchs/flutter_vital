import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBuilder extends StatefulWidget {
  final ThemedWidgetBuilder themedWidgetBuilder;

  ThemeBuilder({
    @required this.themedWidgetBuilder
  });

  @override
  ThemeBuilderState createState() {
    return new ThemeBuilderState(themedWidgetBuilder);
  }

  static Future<String> getCurrentThemeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('currentTheme');
    currentAppThemeName = (theme != null && theme.length>0) ? theme : currentAppThemeName;

    return currentAppThemeName;
  }

  static Future<AppTheme> getCurrentTheme() async {
    String themeValue = await getCurrentThemeValue();
    AppTheme defaultTheme;
    AppTheme currentTheme;

    availableThemes.forEach((ThemeOption to) {
      if(defaultTheme == null)
        defaultTheme = to.theme;

      if(to.value == themeValue)
        currentTheme = to.theme;
    });

    return (currentTheme == null) ? defaultTheme : currentTheme;
  }
}

class ThemeBuilderState extends State<ThemeBuilder> {
  final ThemedWidgetBuilder _themedWidgetBuilder;
  AppTheme _currentTheme;

  ThemeBuilderState(this._themedWidgetBuilder);

  @override
  Widget build(BuildContext context) {
    print(_currentTheme);

    if(_currentTheme == null)
      _currentTheme = AppTheme.getCurrentAppTheme();

    return new DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => _currentTheme.getThemeData(),
        themedWidgetBuilder: _themedWidgetBuilder
    );
  }

  @override
  void initState() {
    _loadCurrentTheme();
    super.initState();
  }

  void _loadCurrentTheme() async {
    AppTheme theme = await ThemeBuilder.getCurrentTheme();

    setState(() {
      _currentTheme = theme;
    });
  }
}

abstract class AppTheme {
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
    return ThemeData();
  }

  static AppTheme getCurrentAppTheme() {
    AppTheme defaultTheme;
    AppTheme currentTheme;

    availableThemes.forEach((ThemeOption to) {
      if(currentAppThemeName == null)
        defaultTheme = to.theme;

      if(currentAppThemeName == to.value)
        currentTheme = to.theme;
    });

    return (currentTheme == null) ? defaultTheme : currentTheme;
  }

  MaterialColor get snackBarBgColor => snackBarBackgroundColor;
  Color getColor(int number) => colors[number];
}

class ThemeOption {
  String label;
  String value;
  AppTheme theme;

  ThemeOption(this.label, this.value, this.theme);
}