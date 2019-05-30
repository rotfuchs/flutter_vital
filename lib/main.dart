import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/about/about_info.dart';
import 'package:flutter_vital/gui/dashboard/dashboard.dart';
import 'package:flutter_vital/gui/form/add_form.dart';
import 'package:flutter_vital/gui/list/edit_list.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/settings/settings_list.dart';
import 'package:flutter_vital/gui/theme_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themedWidgetBuilder: (BuildContext context, theme) {
        return MaterialApp(
          title: 'Flutter Demo',

          localizationsDelegates: [
            const GuiLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          supportedLocales: [
            const Locale('en'),
            const Locale('de'),
          ],

          initialRoute: '/',
          routes: {
            '/': (context) => Dashboard(),
            '/add': (context) => AddForm(),
            '/list': (context) => EditList(),
            '/settings': (context) => Settings(),
            '/about': (context) => AboutInfo(),
          },

          theme: theme,
        );
      },
    );
  }
}
