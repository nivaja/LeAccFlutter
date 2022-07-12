import 'package:flutter/material.dart';

class FrappeNavigationButton extends StatelessWidget {
  late String buttonText;
  Function onPressed;

  FrappeNavigationButton({required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: SizedBox(
          width: 140,
          height: 50,
          child: ElevatedButton(
            onPressed:()=>onPressed(),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[600],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ),
    ));
  }
}
