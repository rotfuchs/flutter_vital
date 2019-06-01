
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/settings/widgets/slider_range_option.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodPressureValuesOption extends StatefulWidget {
  @override
  BloodPressureValuesOptionState createState() {
    return BloodPressureValuesOptionState();
  }
}

class BloodPressureValuesOptionState extends State<BloodPressureValuesOption> {

  BloodPressureValuesRange sysValue = new BloodPressureValuesRange(45, 230);
  BloodPressureValuesRange diaValue = new BloodPressureValuesRange(35, 160);
  BloodPressureValuesRange puleValue = new BloodPressureValuesRange(30, 160);

  @override
  Widget build(BuildContext context) {
    this._loadCurrentValues();

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(Icons.add_circle),
            ),
            Expanded(child: Text(GuiLocalizations.of(context).trans("range_values")),)
          ],
        ),

        RangeSliderOption(
            diaValue.min,
            diaValue.max,
            GuiLocalizations.of(context).trans("diastolic")
        ),

        RangeSliderOption(
            sysValue.min,
            sysValue.max,
            GuiLocalizations.of(context).trans("systolic")
        ),

        RangeSliderOption(
            puleValue.min,
            puleValue.max,
            GuiLocalizations.of(context).trans("pulse")
        )
      ],
    );
  }

//  @override
//  void initState() {
//
//    super.initState();
//  }



  void _loadCurrentValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

//    setState(() {
//      _currentTheme = theme;
//    });
  }

  void _saveOption(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
}

class BloodPressureValuesRange {
  double min;
  double max;

  BloodPressureValuesRange(this.min, this.max);
}