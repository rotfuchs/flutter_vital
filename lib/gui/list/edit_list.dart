import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Query/BloodPressureQueryService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:flutter_vital/gui/list/widgets/checkbox_list_tile.dart';
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
  final bloodPressureQueryService = new BloodPressureQueryService();
  final List<BloodPressure> selectedItems = List<BloodPressure>();
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
      body: new FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Center(
              child: new CircularProgressIndicator(),
            );
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
    List<BloodPressure> values = new List<BloodPressure>.from(snapshot.data);
    int length = values.length*10;

    return ListView.separated(
      itemCount: length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {

        if((index+1)==values.length) {
          print("hossa!");
          snapshot.data.forEach((BloodPressure bp) {
            values.add(bp);
          });

          length += values.length;
        }

        return new EditListCheckboxTile(
            bp:  values[index],
            checkboxChanged: (BloodPressure bp, bool checked) {
              if(checked) {
                selectedItems.add(bp);
              } else {
                selectedItems.remove(bp);
              }
              _controller.add(selectedItems);
            });
      },
    );
  }

  Future<List<BloodPressure>> _getData() async {
    var filter = BloodPressureFilter();
    return bloodPressureQueryService.filter(filter);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

