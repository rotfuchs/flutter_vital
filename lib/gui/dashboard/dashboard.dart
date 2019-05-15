

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () => null,),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () => null,)
        ],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => null,),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 1,
                        child: Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          margin: const EdgeInsets.all(10.0),

                          constraints: BoxConstraints(
                              minHeight: 100
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          margin: const EdgeInsets.all(10.0),

                          constraints: BoxConstraints(
                              minHeight: 100
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                        Card(
                          elevation: 1,
                          child: Container(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            margin: const EdgeInsets.all(10.0),

                            constraints: BoxConstraints(
                                minHeight: 100
                            ),
                          ),
                        ),
                      Card(
                        elevation: 1,
                        child: Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          margin: const EdgeInsets.all(10.0),

                          constraints: BoxConstraints(
                              minHeight: 100
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}