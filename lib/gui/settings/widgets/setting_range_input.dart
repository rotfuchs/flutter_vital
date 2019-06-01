
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RangeInputOption extends StatefulWidget {
  final int _minValue;
  final int _maxValue;
  final String _labelText;

  RangeInputOption(
      this._minValue,
      this._maxValue,
      this._labelText,
  );

  @override
  RangeInputOptionState createState() {
    return RangeInputOptionState(
        this._minValue,
        this._maxValue,
        this._labelText
    );
  }
}

class RangeInputOptionState extends State<RangeInputOption> {
  TextEditingController minTextEditController = new TextEditingController();
  TextEditingController maxTextEditController = new TextEditingController();

  int _minValue;
  int _maxValue;
  String _labelText;

  RangeInputOptionState(
      this._minValue,
      this._maxValue,
      this._labelText
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(0, 16, 10, 0),
            alignment: Alignment(1, 0),
            child: Text(
              _labelText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        Container(
          width: 60,
          child: TextField(
            controller: minTextEditController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: 'Min',

            ),
          ),
        ),
        Container(
          width: 60,
          child: TextField(
            controller: maxTextEditController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: 'Max',

            ),
          ),
        )
      ],
    );
  }
}