import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/gui/form/input_widgets/blood_pressure_form.dart';
import 'package:flutter_vital/gui/form/input_widgets/show_list_icon_button.dart';
import 'package:flutter_vital/gui/localization.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() => AddFormState();
}

class AddFormState extends State<AddForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(GuiLocalizations.of(context).trans('add_entry')),
          actions: <Widget>[
            ShowListIconButton()
          ],
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          children: <Widget>[
            BloodPressureForm()
          ]
        )
    );
  }
}