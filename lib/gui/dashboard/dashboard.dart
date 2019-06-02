import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/gui/dashboard/charts/column_chart.dart';
import 'package:flutter_vital/gui/dashboard/widgets/dia_dashboard_card.dart';
import 'package:flutter_vital/gui/dashboard/widgets/pulse_dashboard_card.dart';
import 'package:flutter_vital/gui/dashboard/widgets/sys_dashboard_card.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:flutter_vital/gui/navigation/appbar_popup_button.dart';

class Dashboard extends StatefulWidget {
  final DateTime startDate = DateTime.now().subtract(Duration(days: 7));
  final DateTime endDate = DateTime.now();

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GuiLocalizations.of(context).trans('dashboard')),
        actions: <Widget>[
          AppbarPopupButton()
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.fromLTRB(12, 12, 0, 6),
              child: Text(
                GuiLocalizations.of(context).trans('dashboard_title'),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SysAverageDashboardCard(
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                      ),
                      PulseAverageDashboardCard(
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                      ),

//                      Card(
//                        child: new Padding(
//                          padding: new EdgeInsets.all(32.0),
//                          child: new SizedBox(
//                            height: 100.0,
//                            child: ColumnChart.withSampleData(),
//                          ),
//                        )
//                      ),

//                      Card(
//                        child: new Padding(
//                          padding: new EdgeInsets.all(22.0),
//                          child: new SizedBox(
//                            height: 100.0,
//                            child: VitalLineChart.withSampleData(),
//                          ),
//                        )
//                      ),

//                      DashboardCard(VitalLineChart.withSampleData()),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      DiaAverageDashboardCard(
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                      ),
//                        Card(
//                          elevation: 1,
//                          child: Container(
////                            alignment: AlignmentDirectional(0.0, 0.0),
//                            margin: const EdgeInsets.all(10.0),
//
//                            constraints: BoxConstraints(
//                                minHeight: 100
//                            ),
//                          ),
//                        ),
//                      Card(
//                        elevation: 1,
//                        child: Container(
////                          alignment: AlignmentDirectional(0.0, 0.0),
//                          margin: const EdgeInsets.all(10.0),
//
//                          constraints: BoxConstraints(
//                              minHeight: 100
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DashboardRatioCard extends StatelessWidget {
  final String label;
  final num ratio;
  final String subLabel;

  DashboardRatioCard(this.label, this.ratio, this.subLabel);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
//          alignment: AlignmentDirectional(0.0, 0.0),
          margin: const EdgeInsets.all(12),
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: ThemeData.dark().hintColor,
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: Text(
                  ratio.toString(),
                  style: TextStyle(
                      fontSize: 50
                  ),
                ),
              ),
              Text(
                subLabel,
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
}

class DashboardCard extends StatelessWidget {
  final Widget childWidget;

  DashboardCard(this.childWidget);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: new Padding(
          padding: new EdgeInsets.all(2),
          child: new SizedBox(
              height: 100.0,
              child: childWidget
          ),
        )
    );
  }
}