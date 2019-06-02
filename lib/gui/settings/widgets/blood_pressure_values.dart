
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
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(Icons.add_circle),
            ),
            Expanded(child: Text(GuiLocalizations.of(context).trans("range_values")),),

          ],
        ),

        RangeSliderOption(
          values: [sysValue.min, sysValue.max],
          min: 0,
          max: 300,
          labelText: GuiLocalizations.of(context).trans("systolic"),
          onDragCompleted: (int handlerIndex, double lowerValue, double upperValue) {
            _saveOption('sys', lowerValue, upperValue);
            sysValue.min = lowerValue;
            sysValue.max = upperValue;
          },
        ),

        RangeSliderOption(
          values: [diaValue.min, diaValue.max],
          min: 0,
          max: 200,
          labelText: GuiLocalizations.of(context).trans("diastolic"),
          onDragCompleted: (int handlerIndex, double lowerValue, double upperValue) {
            _saveOption('dia', lowerValue, upperValue);
            diaValue.min = lowerValue;
            diaValue.max = upperValue;
          },
        ),

        RangeSliderOption(
          values: [puleValue.min, puleValue.max],
          min: 0,
          max: 200,
          labelText: GuiLocalizations.of(context).trans("pulse"),
          onDragCompleted: (int handlerIndex, double lowerValue, double upperValue) {
            _saveOption('pulse', lowerValue, upperValue);
            puleValue.min = lowerValue;
            puleValue.max = upperValue;
          },
        ),

//        Row(
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//              child: RaisedButton(
//                onPressed: () {},
//                child: Text(GuiLocalizations.of(context).trans('reset_range_values')),
//              ),
//            ),
//          ],
//        ),

      ],
    );
  }

  @override
  void initState() {
    _loadCurrentValues();
    super.initState();
  }

  void _loadCurrentValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var sysValues = prefs.getStringList('sys');
    if(sysValues != null && sysValues.length == 2) {
      sysValue.min = double.parse(sysValues[0]);
      sysValue.max = double.parse(sysValues[1]);
    }

    var diaValues = prefs.getStringList('dia');
    if(diaValues != null && diaValues.length == 2) {
      sysValue.min = double.parse(diaValues[0]);
      sysValue.max = double.parse(diaValues[1]);
    }

    var pulseValues = prefs.getStringList('pulse');
    if(pulseValues != null && pulseValues.length == 2) {
      puleValue.min = double.parse(pulseValues[0]);
      puleValue.max = double.parse(pulseValues[1]);
    }
    setState(() {});
  }

  void _saveOption(String key, double minValue, double maxValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, [minValue.toString(), maxValue.toString()]);
  }
}

class BloodPressureValuesRange {
  double min;
  double max;

  BloodPressureValuesRange(this.min, this.max);
}