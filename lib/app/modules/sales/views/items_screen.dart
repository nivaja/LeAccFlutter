import 'package:flutter/material.dart';

import '../../common/views/action_button.dart';
import '../../common/views/button.dart';
import '../../common/views/grid_view.dart';
import '../../common/views/input_field_widget.dart';

class AddItemsSales extends StatefulWidget {
  @override
  _AddItemsSalesState createState() => _AddItemsSalesState();
}

class _AddItemsSalesState extends State<AddItemsSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add items sales'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              FrappeTextField('Search Products...', Icon(Icons.abc)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FrappeButtonField('Clear', TextStyle(color: Colors.red), 100, 40),
                ],
              ),
              FrappeGridView(),
              FrappeGridView(),
              FrappeGridView(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FrappeActionButton(buttonText: 'Back', onPressed: (){}, buttonIcons: Icon(Icons.arrow_back), iconDirectionForButton :TextDirection.ltr),
                  SizedBox(width: 80,),
                  FrappeActionButton(buttonText: 'Validate',onPressed: (){},  buttonIcons: Icon(Icons.arrow_back), iconDirectionForButton :TextDirection.rtl),
                ],
              ),
            ])));
  }
}
