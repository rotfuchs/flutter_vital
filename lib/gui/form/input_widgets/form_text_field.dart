
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/helper.dart';
import 'package:flutter_vital/gui/localization.dart';

class NumericFormTextField extends StatelessWidget {
  final String labelText;
  final String suffixText;
  final double minValue;
  final double maxValue;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;

  NumericFormTextField({
    this.labelText,
    this.suffixText,
    this.minValue,
    this.maxValue,
    this.onSaved,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.title;

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: valueStyle,
      decoration: InputDecoration(
        labelText: labelText,
        suffixText: suffixText,
      ),
      validator: (value) {
        if (value.isEmpty || !isNumeric(value))
          return GuiLocalizations.of(context).trans('please_enter_numeric_value');

        double numValue = double.parse(value);

        if(minValue!=null && numValue<minValue || maxValue!=null && numValue>maxValue)
          return GuiLocalizations.of(context).trans('number_is_out_of_range');
      },
      onSaved: onSaved
    );
  }
}