import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditList extends StatefulWidget {
  EditList({Key key}) : super(key: key);

  @override
  EditListState createState() {
    return EditListState();
  }
}

class EditListState extends State<EditList> {
  final items = List<String>.generate(22, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('readings'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
//          final index = i ~/ 2;
          final item = items[index];
//          if (i.isOdd) return Divider();

//          if(index < items.length) {
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              key: Key(item),
              // We also need to provide a function that tells our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from our data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar!
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away
              background: Container(color: Colors.red),
              child: Column(
                children: <Widget>[ListTile(
                  title: Text('$item'),
                ),
//                Divider(),
                ],
              ),
            );
//          }

        },
      ),
    );
  }
}