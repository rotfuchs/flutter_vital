
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifierOption extends StatefulWidget {
  @override
  NotifierOptionState createState() {
    return NotifierOptionState();
  }
}

class NotifierOptionState extends State<NotifierOption> {

  NotifierOptionState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Text('Ueberschrift!'),)
          ],
        ),
        Row(
          children: <Widget>[
            Text('Wochentage'),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Zeitpunkt'),
          ],
        )
      ],
    );
  }
}