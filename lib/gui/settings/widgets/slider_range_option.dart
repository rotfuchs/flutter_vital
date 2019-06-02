import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeSliderOption extends StatefulWidget {
  final double min;
  final double max;
  final List<double> values;
  final String labelText;
  final Function(int handlerIndex, double lowerValue, double upperValue) onDragging;
  final Function(int handlerIndex, double lowerValue, double upperValue) onDragCompleted;

  RangeSliderOption({
    this.min,
    this.max,
    @required this.values,
    @required this.labelText,
    this.onDragging,
    this.onDragCompleted,
  });

  @override
  RangeSliderOptionState createState() {
    return RangeSliderOptionState(labelText);
  }
}

class RangeSliderOptionState extends State<RangeSliderOption> {
  String _labelText;

  RangeSliderOptionState(this._labelText);

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
                width: 30,
                alignment: Alignment(1, 0),
                child: Text(widget.values[1].toStringAsFixed(0)),
              ),
              Text('Max:', style: TextStyle(fontWeight: FontWeight.bold),),

              Container(
                width: 40,
                alignment: Alignment(1, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(widget.values[0].toStringAsFixed(0)),
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
            values: widget.values,
            rangeSlider: true,
            max: widget.max,
            min: widget.min,
            trackBar: FlutterSliderTrackBar(
                inactiveTrackBarColor: Colors.grey
            ),
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            onDragCompleted: widget.onDragCompleted,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              widget.values[0] = lowerValue;
              widget.values[1] = upperValue;
              setState(() {});

              if(widget.onDragging != null)
                widget.onDragging(handlerIndex, lowerValue, upperValue);
            },
          )
        ),
      ],
    );
  }
}