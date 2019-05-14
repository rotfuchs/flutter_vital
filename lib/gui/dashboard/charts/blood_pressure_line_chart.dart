import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BloodPressureLineChart extends StatefulWidget {
  final List<charts.Series> seriesList;

  BloodPressureLineChart(this.seriesList);

  @override
  BloodPressureLineChartState createState() => BloodPressureLineChartState(this.seriesList);
}

class BloodPressureLineChartState extends State<BloodPressureLineChart> {
  final List<charts.Series> seriesList;

  BloodPressureLineChartState(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
        seriesList,
        animate: true,
        defaultRenderer: new charts.LineRendererConfig(
            includePoints: true),
    );
  }
}

class PulseValue {
  final int pulse;
  final DateTime recordingDate;

  PulseValue(this.recordingDate, this.pulse);
}

// https://google.github.io/charts/flutter/example/line_charts/dash_pattern