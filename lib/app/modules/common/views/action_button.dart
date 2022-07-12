import 'package:flutter/material.dart';

class FrappeNavigationButton extends StatelessWidget {
  late String buttonText;

  FrappeNavigationButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: SizedBox(
          width: 140,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
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
