import 'package:flutter/material.dart';

class FrappeListTile extends StatelessWidget {
  String title;
  String subtitle;
  String? date;
  String? image;
  String trailingText;

  FrappeListTile({required this.title, required this. subtitle,required this.trailingText, this.date,this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: date != null ? Text(date!, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[600]),)
            : CircleAvatar(
          backgroundImage: AssetImage("image.png"),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[600]),),
        trailing:  Text(trailingText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[600]),),
        subtitle: Text(subtitle),
        // tileColor: Colors.grey[100],
      ),
      elevation: 5,
      // shadowColor: Colors.blue[600],
    );
  }
}
