import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Query/BloodPressureQueryService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/navigation/appbar_popup_button.dart';
import 'package:intl/intl.dart';

class EditList extends StatefulWidget {
  EditList({Key key}) : super(key: key);

  @override
  EditListState createState() {
    return EditListState();
  }
}

class EditListState extends State<EditList> {
  final bloodPressureQueryService = new BloodPressureQueryService();
  final List<int> selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GuiLocalizations.of(context).trans('edit_entries')),
        actions: <Widget>[
          TrashIcon(),
          AppbarPopupButton()
        ],
      ),
      body: new FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
           return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
          }
        },
      )
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<BloodPressure> values = snapshot.data;

    return ListView.separated(
      itemCount: values.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        BloodPressure bp = values[index];

        return new EditListCheckboxTile(bp);
      },
    );
  }

  Future<List<BloodPressure>> _getData() async {
    var filter = BloodPressureFilter();
    return bloodPressureQueryService.filter(filter);
  }
}

final testController = StreamController<List<BloodPressure>>();

class TrashIconController {
  List<BloodPressure> items = List();
  Stream<List<BloodPressure>> get bpItems => testController.stream;

  void add(BloodPressure bp) {
    items.add(bp);
    testController.add(items);
  }

  void remove(BloodPressure bp) {
    items.remove(bp);
    testController.add(items);
  }
}

class TrashIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: testController.stream,
      builder: (context, shot) {

        if(shot.hasData && shot.data.length>0) {
          return Icon(Icons.delete);
        }

        return Container();
      }
    );
  }
}




class EditListCheckboxTile extends StatefulWidget {
  final BloodPressure _bp;

  EditListCheckboxTile(this._bp);

  @override
  EditListCheckboxTileState createState() {
    return EditListCheckboxTileState(_bp);
  }
}

class EditListCheckboxTileState extends State<EditListCheckboxTile> {
  final BloodPressure _bp;
  bool _checked = false;

  EditListCheckboxTileState(this._bp);

  @override
  Widget build(BuildContext context) {
    Locale _myLocale = Localizations.localeOf(context);
    String title = DateFormat.yMMMd(_myLocale.languageCode).format(_bp.created).toString();


    return CheckboxListTile(
      title: Text(title),
      subtitle: Text(
        "Puls: "+ _bp.pulse.toString() +", Dia: "+ _bp.diastolic.toString() +", Sys: "+ _bp.systolic.toString(),
        style: TextStyle(fontSize: 16),
      ),
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = (!_checked);

          var controller = TrashIconController();
          if(_checked) {
            controller.add(_bp);
          } else {
            controller.remove(_bp);
          }
        });
      },
    );
  }
}
