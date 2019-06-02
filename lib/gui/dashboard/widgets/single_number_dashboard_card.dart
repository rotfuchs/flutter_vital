
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/localization.dart';

class SingleNumberDashboardCard extends StatelessWidget {
  final double ratioNumber;
  final String title;
  final String subText;

  SingleNumberDashboardCard({
    @required this.ratioNumber,
    @required this.title,
    @required this.subText,
  });

  @override
  Widget build(BuildContext context) {

    String _getSubText() {
      if(this.hasErrors())
        return GuiLocalizations.of(context).trans('error_occured');

      if(ratioNumber==0)
        return GuiLocalizations.of(context).trans('no_data_available');

      return this.subText;
    }

    return Card(
      child: Container(
        margin: const EdgeInsets.all(12),
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 0, 6),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: ThemeData.dark().hintColor,
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 0, 6),
              child: Text(
                _getRatioNumber(),
                style: TextStyle(
                    fontSize: 50
                ),
              ),
            ),
            Text(
              _getSubText(),
              style: TextStyle(
                fontSize: 16,
                color: ThemeData.dark().hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getRatioNumber() {
    if(this.hasErrors())
      return "ERROR";

    if(ratioNumber==0)
      return "N/A";

    return (ratioNumber.toStringAsFixed(1) != ratioNumber.toString())
        ? ratioNumber.toStringAsFixed(1) : ratioNumber.toStringAsFixed(0);
  }

  bool hasErrors() {
    return (ratioNumber<0);
  }
}