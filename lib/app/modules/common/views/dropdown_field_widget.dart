import 'package:flutter/material.dart';

class FrappeDropdownField extends StatefulWidget {
  late Icon dropdownFieldIcons;
  List<String> dropdownList;
  FrappeDropdownField({required this.dropdownFieldIcons, required this.dropdownList});
  @override
  State<FrappeDropdownField> createState() => _FrappeDropdownFieldState();
}

class _FrappeDropdownFieldState extends State<FrappeDropdownField> {
  String dropdownValue = 'Type Of Customer';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(value: dropdownValue, items: widget.dropdownList.map((String items) {
      return DropdownMenuItem(
          value: items,
          child: Text(items)
      );
    }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      decoration:InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(),
          icon: widget.dropdownFieldIcons,
          // labelText: text,
          labelStyle: TextStyle(
            color: Colors.blue[600],
          )
      ),
    );
  }
}



