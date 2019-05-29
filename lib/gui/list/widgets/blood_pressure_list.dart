import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Query/BloodPressureQueryService.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:flutter_vital/gui/list/widgets/checkbox_list_tile.dart';


class BloodPressureList extends StatefulWidget {
  final StreamController<List<BloodPressure>> _controller;

  BloodPressureList(this._controller);

  @override
  BloodPressureListState createState() {
    return BloodPressureListState(this._controller);
  }
}

class BloodPressureListState extends State<BloodPressureList> {
  final bloodPressureQueryService = new BloodPressureQueryService();
  final List<BloodPressure> _allItems = new List<BloodPressure>();
  final List<BloodPressure> selectedItems = List<BloodPressure>();
  final StreamController<List<BloodPressure>> _controller;
  final int _limit = 100;
  final int _offset = 0;

  BloodPressureListState(this._controller);

  @override
  Widget build(BuildContext context) {

    return new FutureBuilder(
      future: _count(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return _buildLoadingScreen();
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
//    List<BloodPressure> bpItems = new List<BloodPressure>();

    return ListView.separated(
      itemCount: snapshot.data,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {

//        if((index+1)==values.length) {
//          print("hossa!");
//          snapshot.data.forEach((BloodPressure bp) {
//            values.add(bp);
//          });
//
//          length += values.length;
//        }

        if(_allItems.length<=(index+1)) {
          return _loadListItems(index);
        } else {
          return _buildListItem(_allItems[index]);
        }

      },
    );
  }

  Widget _loadListItems(int index) {
    return new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return _buildLoadingScreen();
          default:
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            } else {
              _allItems.addAll(snapshot.data);
              return _buildListItem(_allItems[index]);
            }
        }
      },
    );
  }

  Widget _buildListItem(BloodPressure bp) {
    return new EditListCheckboxTile(
        bp:  bp,
        checkboxChanged: (BloodPressure bpItem, bool checked) {
          if(checked) {
            selectedItems.add(bpItem);
          } else {
            selectedItems.remove(bpItem);
          }
          _controller.add(selectedItems);
        });
  }

  Widget _buildLoadingScreen() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Future<List<BloodPressure>> _getData() async {
    var filter = BloodPressureFilter();
    filter.limit = _limit;
    filter.offset = _offset;

    return bloodPressureQueryService.filter(filter);
  }

  Future<int> _count() async {
    var filter = BloodPressureFilter();
    return bloodPressureQueryService.count(filter);
  }
}
