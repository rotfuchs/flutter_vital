

import 'package:flutter_vital/gui/theme_builder.dart';
import 'package:flutter_vital/gui/themes/dark_blue.dart';
import 'package:flutter_vital/gui/themes/dark_purple.dart';

final sqLiteDatabaseName = "database_vital.db";

String currentAppThemeName = 'DarkPurple';

final List<ThemeOption> availableThemes = [
  ThemeOption('dark_purple_name', 'DarkPurple', DarkPurpleTheme()),
  ThemeOption('dark_blue_name', 'DarkBlue', DarkBlueTheme()),
//  ThemeOption('dark_red_name', 'DarkRed'),
//  ThemeOption('bright_blue_name', 'BrightBlue'),
];