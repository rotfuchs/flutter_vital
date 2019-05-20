import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/gui/dashboard/charts/blood_pressure_line_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_vital/gui/form/add_form.dart';
import 'package:flutter_vital/gui/list/edit_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: [
        const Locale('en'),
        const Locale('de'),
      ],

      home: EditList(),

      theme: ThemeData.dark()


//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Dashboard'),
//        ),
//        body: Container(
//          padding: const EdgeInsets.all(8),
//          child: BloodPressureLineChart(_createSampleData()),
//          height: 400,
//        )

//      ) //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  static List<charts.Series<PulseValue, DateTime>> _createSampleData() {
    final data = [
      new PulseValue(new DateTime(2017, 9, 19), 5),
      new PulseValue(new DateTime(2017, 9, 26), 25),
      new PulseValue(new DateTime(2017, 10, 3), 100),
      new PulseValue(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<PulseValue, DateTime>(
        id: 'Pulse',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PulseValue pulse, _) => pulse.recordingDate,
        measureFn: (PulseValue pulse, _) => pulse.pulse,
        data: data,
        labelAccessorFn: (PulseValue row, _) => '${row.pulse}',
      )
    ];
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
