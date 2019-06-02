import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Query/BloodPressureQueryService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:flutter_vital/gui/action_notifier.dart';
import 'package:flutter_vital/gui/dashboard/widgets/single_number_dashboard_card.dart';
import 'package:flutter_vital/gui/localization.dart';

class DiaAverageDashboardCard extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  DiaAverageDashboardCard({
    @required this.startDate,
    @required this.endDate
  });

  @override
  DiaAverageDashboardCardState createState() => DiaAverageDashboardCardState();
}

class DiaAverageDashboardCardState extends State<DiaAverageDashboardCard> {
  final BloodPressureQueryService _queryService = new BloodPressureQueryService();
  double ratioNumber = 0;
  String subText = '';

  @override
  Widget build(BuildContext context) {
    _initActionNotifier();

    return SingleNumberDashboardCard(
      title: 'Dia',
      ratioNumber: ratioNumber,
      subText: subText,
    );
  }

  void _buildRatioNumber() async {
    var filter = new BloodPressureFilter();
    filter.createdDateStart = widget.startDate;
    filter.createdDateEnd = widget.endDate;

    List<BloodPressure> ratioValues;
    ratioValues = await _queryService.filter(filter);

    setState(() {
      ratioNumber = _getRatioNumber(ratioValues);
      subText = _getSubText(ratioValues);
    });
  }

  double _getRatioNumber(List<BloodPressure> values) {
    double valuesSum = 0;

    values.forEach((BloodPressure bp) {
      valuesSum = valuesSum + bp.diastolic;
    });

    return (values.length>0 && valuesSum>0) ? valuesSum / values.length : 0;
  }

  String _getSubText(List<BloodPressure> values) {
    int riseCounter = 0;
    int fallCounter = 0;
    double lastValue;

    values.forEach((BloodPressure bp) {
      if(lastValue != null) {
        if(lastValue > bp.diastolic) {
          riseCounter++;
        } else if(lastValue < bp.diastolic) {
          fallCounter++;
        }
      } else {
        lastValue = bp.diastolic;
      }
    });

    if(riseCounter>fallCounter) {
      return GuiLocalizations.of(context).trans('ascending_trend');
    }else if(riseCounter<fallCounter) {
      return GuiLocalizations.of(context).trans('descending_trend');
    } else {
      return GuiLocalizations.of(context).trans('average_value');
    }
  }

  @override
  void initState() {
    super.initState();
    _buildRatioNumber();
  }

  void _initActionNotifier() {
    ActionNotifier.addListener(() {
      switch(ActionNotifier.value) {
        case 'item_saved':
        case 'item_deleted':
          _buildRatioNumber();
          break;
      }
    });
  }
}