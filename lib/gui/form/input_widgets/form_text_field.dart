
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/helper.dart';
import 'package:flutter_vital/gui/localization.dart';

class NumericFormTextField extends StatelessWidget {
  final String labelText;
  final String suffixText;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;

  NumericFormTextField({
    this.labelText,
    this.suffixText,
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
        if (value.isEmpty || !isNumeric(value)) {
          return GuiLocalizations.of(context).trans('please_enter_numeric_value');
        }
      },
      onSaved: onSaved
    );
  }
}