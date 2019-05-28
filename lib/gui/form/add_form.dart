import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Command/BloodPressureCommandService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/gui/form/input_widgets/date_time_picker.dart';
import 'package:flutter_vital/gui/form/input_widgets/form_text_field.dart';
import 'package:flutter_vital/gui/form/input_widgets/show_list_icon_button.dart';
import 'package:flutter_vital/gui/localization.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
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
    //@todo create form widget for a seperate scaffold widget
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Text(GuiLocalizations.of(context).trans('add_entry')),
          actions: <Widget>[
            ShowListIconButton()
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

                  dateTimePicker(),
                  sysTextField(),
                  diaTextField(),
                  pulseTextField(),

                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: saveButton(context)
                  )
                ],
              )
            )
          ]
        )
    );

    return scaffold;
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
      return SaveFormButton(
        onPressed: () {
            if(_formKey.currentState.validate()) {
              var bloodPressureCommandService = new BloodPressureCommandService();

              print(_bp.toMap());

            bloodPressureCommandService.save(_bp).then((success) {
//              showSnackBar(context, success);
//              onSaved();
            });
            }
        },
      );
  }

  void clear() {
    diaTextController.text = "";
    sysTextController.text = "";
    pulseTextController.text = "";
  }

}

class SaveFormButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveFormButton({
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
          GuiLocalizations.of(context).trans('save')
      ),
    );
  }

  void showSnackBar(BuildContext context, bool success) {
    String snackBarText;

    if(success) {
      snackBarText = GuiLocalizations.of(context).trans('saved_values_successfull');

      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text( snackBarText )));
    }
  }
}