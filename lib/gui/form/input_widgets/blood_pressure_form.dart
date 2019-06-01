import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Command/BloodPressureCommandService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/gui/form/input_widgets/date_time_picker.dart';
import 'package:flutter_vital/gui/form/input_widgets/form_text_field.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/theme_builder.dart';

class BloodPressureForm extends StatefulWidget {
  @override
  BloodPressureFormState createState() => BloodPressureFormState();
}

class BloodPressureFormState extends State<BloodPressureForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = TimeOfDay.now();
  BloodPressure _bp = new BloodPressure();

  TextEditingController diaTextController = new TextEditingController();
  TextEditingController sysTextController = new TextEditingController();
  TextEditingController pulseTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _bp.created = _fromDate;
    _bp.created.add(new Duration(hours: _fromTime.hour, minutes: _fromTime.minute, seconds: 0));

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              GuiLocalizations.of(context).trans('blood_pressure_values'),
              style: TextStyle(fontSize: 15),
            ),
          ),

          dateTimePicker(),
          sysTextField(),
          diaTextField(),
          pulseTextField(),



          Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[Expanded(child: saveButton(context),)],),
          )
        ],
      )
    );

  }

  Widget dateTimePicker() {
    return DateTimePicker(
      labelText: GuiLocalizations.of(context).trans('from'),
      selectedDate: _fromDate,
      selectedTime: _fromTime,
      selectDate: (DateTime date) {
        setState(() {
          _fromDate = date;
          _bp.created = date;
          _bp.created.add(new Duration(hours: _fromTime.hour, minutes: _fromTime.minute));
        });
      },
      selectTime: (TimeOfDay time) {
        setState(() {
          _fromTime = time;
          _bp.created.add(new Duration(hours: _fromTime.hour, minutes: _fromTime.minute));
        });
      },
    );
  }

  Widget diaTextField() {
    return NumericFormTextField(
      labelText: "Dia",
      suffixText: "mmHg",
      onSaved: (String value) {
        _bp.diastolic = double.parse(value);
      },
      controller: diaTextController,
    );
  }

  Widget sysTextField() {
    return NumericFormTextField(
      labelText: "Sys",
      suffixText: "mmHg",
      onSaved: (String value) {
        _bp.systolic = double.parse(value);
      },
      controller: sysTextController,
    );
  }

  Widget pulseTextField() {
    return NumericFormTextField(
      labelText: "Puls",
      suffixText: "min",
      onSaved: (String value) {
        _bp.pulse = double.parse(value);
      },
      controller: pulseTextController,
    );
  }

  Widget saveButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();

          var bloodPressureCommandService = new BloodPressureCommandService();

          bloodPressureCommandService.save(_bp).then((success) {
            print( _bp.toMap() );
            showSnackBar(context, success);
            clear();
          });
        }
      },
      child: Text(
          GuiLocalizations.of(context).trans('save')
      ),
    );
  }

  void clear() {
    diaTextController.text = "";
    sysTextController.text = "";
    pulseTextController.text = "";

    _bp = new BloodPressure();
    _bp.created = _fromDate;
    _bp.created.add(new Duration(hours: _fromTime.hour, minutes: _fromTime.minute, seconds: 0));
  }

  void showSnackBar(BuildContext context, bool success) {
    String snackBarText;

    if(success) {
      snackBarText = GuiLocalizations.of(context).trans('saved_values_successfull');

      Scaffold
          .of(context)
          .showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.getCurrentAppTheme().snackBarBgColor,
              content: Row(
                children: <Widget>[
                  Icon(Icons.check_circle),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(snackBarText, style: TextStyle(),),
                  )
                ],
              ))
          );
    }
  }
}