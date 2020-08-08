import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_tracker_flutter/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaiseButton {
  SignInButton(
      {@required String text,
      Color color,
      Color textColor,
      VoidCallback onPressed})
      : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            color: color,
            onPressed: onPressed);
}
