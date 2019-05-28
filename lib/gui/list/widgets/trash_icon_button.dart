
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrashIcon extends StatelessWidget {
  final Stream _stream;

  TrashIcon(this._stream);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: _stream,
      builder: (context, shot) {

        if(shot.hasData && shot.data.length>0) {
          print(shot.data.length);
          return IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {

            }
          );
        }

        return Container();
      }
    );
  }
}