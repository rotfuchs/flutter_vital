import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/navigation/appbar_popup_button.dart';

class EditList extends StatefulWidget {
  EditList({Key key}) : super(key: key);

  @override
  EditListState createState() {
    return EditListState();
  }
}

class EditListState extends State<EditList> {
  final items = List<String>.generate(22, (i) => "Item ${i + 1}");
  final selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(GuiLocalizations.of(context).trans('edit_entries')),
        actions: <Widget>[AppbarPopupButton()],
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text('19.05.2019'),
              subtitle: Text("Puls: 12, Dia: 80, Sys 95", style: TextStyle(fontSize: 16),),
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
      ),
    );
  }
}