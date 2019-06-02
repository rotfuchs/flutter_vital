import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Query/BloodPressureQueryService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:flutter_vital/gui/dashboard/widgets/single_number_dashboard_card.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleNumberDashboardCard(
      title: 'Dia',
      ratioNumber: ratioNumber,
      subText: 'blub',
    );
  }

  void _buildRatioNumber() async {
    List<BloodPressure> values;
    double valuesSum = 0;

    var filter = new BloodPressureFilter();
    filter.createdDateStart = widget.startDate;
    filter.createdDateEnd = widget.endDate;

    values = await _queryService.filter(filter);
    values.forEach((BloodPressure bp) {
      valuesSum = valuesSum + bp.diastolic;
    });

    setState(() {
      ratioNumber = (values.length>0 && valuesSum>0) ? valuesSum / values.length : 0;
    });
  }

  @override
  void initState() {
    _buildRatioNumber();
    super.initState();
  }
}