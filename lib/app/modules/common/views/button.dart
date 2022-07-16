import 'package:flutter/material.dart';

class FrappeButtonField extends StatelessWidget {
  late String buttonText;
  late TextStyle buttonTextColor;
  double buttonWidth;
  double buttonHeight;

  FrappeButtonField(this.buttonText, this.buttonTextColor, this.buttonWidth, this.buttonHeight);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child : SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child: Text(
              buttonText,
              style: buttonTextColor,
            ),
          ),
        )
    );
  }
}
