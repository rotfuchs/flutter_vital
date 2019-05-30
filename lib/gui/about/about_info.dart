

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/localization.dart';

class AboutInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(GuiLocalizations.of(context).trans('about')),
          actions: <Widget>[
          ],
        ),
        body: ListView(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
            children: <Widget>[
            ]
        )
    );
  }
}