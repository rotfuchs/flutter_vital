import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vital/gui/form/input_widgets/date_time_picker.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add form'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () => null,),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () => null,)
          ],
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () => null,),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text('blood pressure values', style: TextStyle(fontSize: 20),),
                  ),

                  DateTimePicker(
                    labelText: 'From',
                    selectedDate: _fromDate,
                    selectedTime: _fromTime,
                    selectDate: (DateTime date) {
                      setState(() {
                        _fromDate = date;
                      });
                    },
                    selectTime: (TimeOfDay time) {
                      setState(() {
                        _fromTime = time;
                      });
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Sys',
                        suffixText: 'mmHg',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return 'Please enter a numeric value';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Dia',
                        suffixText: 'mmHg',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return 'Please enter a numeric value';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: 'Puls',
                        suffixText: 'min'
                    ),
                    validator: (value) {
                      if (value.isEmpty || !isNumeric(value)) {
                        return 'Please enter a numeric value';
                      }
                    },
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
//                        // If the form is valid, we want to show a Snackbar
//                        Scaffold.of(context)
//                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text('Save'),
                    ),
                  )







                ],
              )
            )
          ]
        )
    );
  }
}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.parse(s) != null;
}