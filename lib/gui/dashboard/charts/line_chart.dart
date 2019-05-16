import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VitalLineChart extends StatefulWidget {
  final List<charts.Series> seriesList;

  VitalLineChart(this.seriesList);

  factory VitalLineChart.withSampleData() {
    return new VitalLineChart(
      _createSampleData(),
    );
  }

  @override
  VitalLineChartState createState() => VitalLineChartState(this.seriesList);

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class VitalLineChartState extends State<VitalLineChart> {
  final List<charts.Series> seriesList;

  VitalLineChartState(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,

      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.NoneRenderSpec()
      ),

      domainAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        renderSpec: new charts.NoneRenderSpec()
      ),

//      domainAxis: new charts.OrdinalAxisSpec(
//          showAxisLine: true,
//          renderSpec: new charts.NoneRenderSpec()
//      ),

//      layoutConfig: new charts.LayoutConfig(
//          leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
//          topMarginSpec: new charts.MarginSpec.fixedPixel(0),
//          rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
//          bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)
//      ),
    );
  }
}

/// Sample time series data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}