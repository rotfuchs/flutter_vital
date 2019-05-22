import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/localization.dart';

class AppbarPopupButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void handlePopUpChanged(String value) {
      switch(value) {
        case 'edit_list':
          Navigator.pushNamed(context, '/list');
          break;
      }
    }

    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (selectedDropDownItem) => handlePopUpChanged(selectedDropDownItem),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: Text(GuiLocalizations.of(context).trans('edit_entries')), value: 'edit_list',),
          PopupMenuItem(child: Text(GuiLocalizations.of(context).trans('settings')), value: 'settings',),
          PopupMenuItem(child: Text(GuiLocalizations.of(context).trans('about')), value: 'about',),
        ];
      },
    );
  }


}