import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/config.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/theme_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSwitcherOption extends StatefulWidget {
  @override
  ThemeSwitcherOptionState createState() {
    return ThemeSwitcherOptionState();
  }
}

class ThemeSwitcherOptionState extends State<ThemeSwitcherOption> {
  String _currentTheme;

  ThemeSwitcherOptionState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Icon(Icons.image),
              ),
              Text(GuiLocalizations.of(context).trans("switch_theme")),
            ],
          )
        ),
        _getDropdownButton(context),
      ],
    );
  }

  @override
  void initState() {
    _loadCurrentTheme();
    super.initState();
  }

  Widget _getDropdownButton(BuildContext context) {
    print(_currentTheme);
    return new DropdownButton(
      value: _currentTheme,
      items: _buildDropDownOptionList(context),
      onChanged: (value) {
       setState(() {
         _currentTheme = value;
         currentAppThemeName = value;
         _saveTheme(value);
         DynamicTheme.of(context).setThemeData(AppTheme.getCurrentAppTheme().getThemeData());
       });
      },
    );
  }

  Widget _buildDropDownOption(BuildContext context, ThemeOption to) {
    return new DropdownMenuItem(
        value: to.value,
        child: new Text(GuiLocalizations.of(context).trans(to.label))
    );
  }

  List<DropdownMenuItem> _buildDropDownOptionList(BuildContext context) {
    List<DropdownMenuItem> _list = new List();

    availableThemes.forEach((ThemeOption to) {
      _list.add(_buildDropDownOption(context, to));
    });

    return _list;
  }

  void _loadCurrentTheme() async {
    String theme = await ThemeBuilder.getCurrentThemeValue();

    setState(() {
      _currentTheme = theme;
    });
  }

  void _saveTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentTheme", theme);
  }
}

