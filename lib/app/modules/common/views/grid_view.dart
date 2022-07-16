import 'package:flutter/material.dart';

class FrappeGridView extends StatelessWidget {
  // String itemsIdText;
  // String priceText;
  //
  // FrappeAddItemCard(this.itemsIdText, this.priceText);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child:  Card(
            elevation: 5,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network("https://picsum.photos/250?image=9",
                  height : 110,
                  width: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5,),

                Text("Item-001",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[600],
                  ),
                ),
                SizedBox(height: 7,),
                Text("Rs.89",
                  style: TextStyle(
                    fontSize: 17,
                  ),),


              ],
            ),
          ),
        ),

        Container(
          child:  Card(
            elevation: 5,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network("https://picsum.photos/250?image=9",
                  height : 110,
                  width: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5,),

                Text("Item-001",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[600],
                  ),
                ),
                SizedBox(height: 7,),
                Text("Rs.89",
                  style: TextStyle(
                    fontSize: 17,
                  ),),


              ],
            ),
          ),
        ),

      ]
      ,
    );
  }
}
