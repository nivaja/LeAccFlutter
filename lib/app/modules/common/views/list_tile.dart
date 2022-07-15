import 'package:flutter/material.dart';

class FrappeListTile extends StatelessWidget {
  String itemsIdText;
  String priceText;
  String unitText;

  FrappeListTile(this.itemsIdText, this.priceText, this.unitText);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("image.png"),
        ),
        title: Text(itemsIdText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[600]),),
        trailing:  Text(priceText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[600]),),
        subtitle: Text(unitText),
        // tileColor: Colors.grey[100],
      ),
      elevation: 5,
      // shadowColor: Colors.blue[600],
    );
  }
}
