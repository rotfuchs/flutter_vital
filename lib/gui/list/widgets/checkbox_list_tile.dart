import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:intl/intl.dart';

class EditListCheckboxTile extends StatefulWidget {
  final BloodPressure bp;
  final Function(BloodPressure, bool) checkboxChanged;

  const EditListCheckboxTile({
    this.bp,
    this.checkboxChanged
  });

  @override
  EditListCheckboxTileState createState() {
    return EditListCheckboxTileState(bp, checkboxChanged);
  }
}

class EditListCheckboxTileState extends State<EditListCheckboxTile> {
  final BloodPressure _bp;
  final Function(BloodPressure, bool) _checkboxChanged;
  bool _checked = false;

  EditListCheckboxTileState(this._bp, this._checkboxChanged);

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
          _checkboxChanged(_bp, _checked);

//          if(_checked) {
//            _controller.add(_bp);
//          } else {
//            _controller.remove(_bp);
//          }
        });
      },
    );
  }
}