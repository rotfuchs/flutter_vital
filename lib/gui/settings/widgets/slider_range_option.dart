import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeSliderOption extends StatefulWidget {
  final double _minValue;
  final double _maxValue;
  final String _labelText;

  RangeSliderOption(
      this._minValue,
      this._maxValue,
      this._labelText,
  );

  @override
  RangeSliderOptionState createState() {
    return RangeSliderOptionState(this._minValue, this._maxValue, this._labelText);
  }
}

class RangeSliderOptionState extends State<RangeSliderOption> {
  double _minValue;
  double _maxValue;
  String _labelText;

  RangeSliderOptionState(this._minValue, this._maxValue, this._labelText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Container(
                width: 40,
                alignment: Alignment(1, 0),
                child: Text(_maxValue.toString()),
              ),
              Text('Max:', style: TextStyle(fontWeight: FontWeight.bold),),

              Container(
                width: 50,
                alignment: Alignment(1, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(_minValue.toString()),
              ),
              Text('Min:', style: TextStyle(fontWeight: FontWeight.bold),),

              Expanded(
                child: Text(_labelText, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          )
        ),
        Container(
          child: FlutterSlider(
            values: [_minValue, _maxValue],
            rangeSlider: true,
            max: 500,
            min: 0,
            trackBar: FlutterSliderTrackBar(
                inactiveTrackBarColor: Colors.grey
            ),
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _minValue = lowerValue;
              _maxValue = upperValue;
              setState(() {});
            },
          )
        ),
      ],
    );
  }
}