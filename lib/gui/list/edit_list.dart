import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/gui/list/widgets/blood_pressure_list.dart';
import 'package:flutter_vital/gui/list/widgets/trash_icon_button.dart';
import 'package:flutter_vital/gui/localization.dart';


class EditList extends StatefulWidget {
  EditList({Key key}) : super(key: key);

  @override
  EditListState createState() {
    return EditListState();
  }
}

class EditListState extends State<EditList> {
  final StreamController<List<BloodPressure>> _controller =  new StreamController<List<BloodPressure>>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(GuiLocalizations.of(context).trans('edit_entries')),
        actions: <Widget>[
          TrashIcon(_controller.stream),
        ],
      ),
      body: BloodPressureList(_controller),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

