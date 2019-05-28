
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowListIconButton extends StatelessWidget {

  ShowListIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          Navigator.pushNamed(context, '/list');
        }
    );
  }
}