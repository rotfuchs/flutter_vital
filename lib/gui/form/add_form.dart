import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Command/BloodPressureCommandService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/gui/form/input_widgets/date_time_picker.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/navigation/appbar_popup_button.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = TimeOfDay.now();
  BloodPressure _bp = new BloodPressure();

  @override
  Widget build(BuildContext context) {
    _bp.created = _fromDate;
    _bp.created.add(new Duration(hours: _fromTime.hour, minutes: _fromTime.minute, seconds: 0));

    return Scaffold(
        appBar: AppBar(
          title: Text(GuiLocalizations.of(context).trans('add_entry')),
          actions: <Widget>[
            AppbarPopupButton()
          ],
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      GuiLocalizations.of(context).trans('blood_pressure_values'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  DateTimePicker(
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
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Sys',
                        suffixText: 'mmHg',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return GuiLocalizations.of(context).trans('please_enter_numeric_value');
                      }
                    },
                    onSaved: (String value) {
                      _bp.systolic = double.parse(value);
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Dia',
                        suffixText: 'mmHg',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return GuiLocalizations.of(context).trans('please_enter_numeric_value');
                      }
                    },
                    onSaved: (String value) {
                      _bp.diastolic = double.parse(value);
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Puls',
                        suffixText: 'min'
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return GuiLocalizations.of(context).trans('please_enter_numeric_value');
                      }
                    },
                    onSaved: (String value) {
                      _bp.pulse = double.parse(value);
                    },
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(_bp.toMap());

                          var bloodPressureCommandService = new BloodPressureCommandService();

                          bloodPressureCommandService.save(_bp).then((success) {
                            print(success);
                            print(_bp.toMap());
                          });

//                        // If the form is valid, we want to show a Snackbar
//                        Scaffold.of(context)
//                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text(
                        GuiLocalizations.of(context).trans('save')
                      ),
                    ),
                  )
                ],
              )
            )
          ]
        )
    );
  }


}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.parse(s) != null;
}