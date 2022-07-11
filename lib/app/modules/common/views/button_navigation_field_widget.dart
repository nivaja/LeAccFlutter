import 'package:flutter/material.dart';

class FrappeNavigationButtonField extends StatelessWidget {
  late String buttonText;
  FrappeNavigationButtonField(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 140.0,
      height: 50.0,
      child: RaisedButton(onPressed: (){
      },
        child: Text(buttonText, style: TextStyle(color: Colors.white),),
        color: Colors.blue[600],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9)
        ),
      ),
    );
  }
}




