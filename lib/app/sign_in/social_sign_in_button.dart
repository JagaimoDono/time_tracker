import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_tracker_flutter/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaiseButton {
  SocialSignInButton(
      {IconData icon,
      String text,
      Color color,
      Color textColor,
      VoidCallback onPressed})
      : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FaIcon(
                  icon,
                ),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: FaIcon(
                    icon,
                  ),
                ),
              ],
            ),
            color: color,
            onPressed: onPressed);
}
