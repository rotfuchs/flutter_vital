
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Command/BloodPressureCommandService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/theme_builder.dart';

class TrashIcon extends StatelessWidget {
  final BloodPressureCommandService _bloodPressureCommandService = new BloodPressureCommandService();
  final List<BloodPressure> _selectedItems = new List<BloodPressure>();
  final Stream _stream;
  final ValueNotifier<String> _notifier;

  TrashIcon(this._stream, this._notifier);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: _stream,
      builder: (context, shot) {
        if(shot.hasData && shot.data.length>0) {
          _selectedItems.clear();
          _selectedItems.addAll(shot.data);

          return IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _bloodPressureCommandService.deleteList(_selectedItems).then((bool success) {
                showSnackBar(context, true);
                _notifier.value = "items_deleted";
              });
            }
          );
        }

        return Container();
      }
    );
  }

  void showSnackBar(BuildContext context, bool success) {
    String snackBarText;

    if(success) {
      snackBarText = GuiLocalizations.of(context).trans('deleted_values_successfull');

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