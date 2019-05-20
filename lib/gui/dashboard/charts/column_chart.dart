import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ColumnChart extends StatefulWidget {
  final List<charts.Series> seriesList;

  ColumnChart(this.seriesList);

  factory ColumnChart.withSampleData() {
    return new ColumnChart(
      _createSampleData(),
    );
  }

  @override
  ColumnChartState createState() => ColumnChartState(this.seriesList);

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      new OrdinalSales('2007', 3100),
      new OrdinalSales('2008', 3500),
      new OrdinalSales('2009', 5000),
      new OrdinalSales('2010', 2500),
      new OrdinalSales('2011', 3200),
      new OrdinalSales('2012', 4500),
      new OrdinalSales('2013', 4400),
      new OrdinalSales('2014', 5000),
      new OrdinalSales('2015', 5000),
      new OrdinalSales('2016', 4500),
      new OrdinalSales('2017', 4300),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      ),
    ];
  }
}

class ColumnChartState extends State<ColumnChart> {
  final List<charts.Series> seriesList;

  ColumnChartState(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: true,

      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.NoneRenderSpec()
      ),
      domainAxis: new charts.OrdinalAxisSpec(
          showAxisLine: true,
          renderSpec: new charts.NoneRenderSpec()
      ),
      layoutConfig: new charts.LayoutConfig(
          leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
          topMarginSpec: new charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)),
      );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}