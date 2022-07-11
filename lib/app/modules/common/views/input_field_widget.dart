import 'package:flutter/material.dart';

class FrappeTextField extends StatelessWidget {
  late String text;
  final Icon fieldIcons;
  FrappeTextField (this.text, this.fieldIcons);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(),
          icon: fieldIcons,
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.blue[600],
          )
      ),
    );
  }
}
