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
        actions: <Widget>[AppbarPopupButton()],
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
    Locale _myLocale = Localizations.localeOf(context);

    return ListView.separated(
      itemCount: values.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        BloodPressure bp = values[index];
        String title = DateFormat.yMMMd(_myLocale.languageCode).format(bp.created).toString();

        return CheckboxListTile(
          title: Text(title),
          subtitle: Text("Puls: "+ bp.pulse.toString() +", Dia: "+ bp.diastolic.toString() +", Sys: "+ bp.systolic.toString(), style: TextStyle(fontSize: 16),),
          value: (selectedItems.indexOf(index)>=0),
          onChanged: (bool value) {
            setState(() {
              int selectedItemsIndex = selectedItems.indexOf(index);

              if(value) {
                selectedItems.add(index);
              } else if(selectedItemsIndex>=0) {
                selectedItems.removeAt(selectedItemsIndex);
              }
            });
          },
        );
      },
    );
  }

  Future<List<BloodPressure>> _getData() async {
    var filter = BloodPressureFilter();
    return bloodPressureQueryService.filter(filter);
  }
}