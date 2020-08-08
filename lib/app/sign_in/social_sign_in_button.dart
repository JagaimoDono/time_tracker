import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_tracker_flutter/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaiseButton {
  SocialSignInButton(
      {@required IconData icon,
      @required String text,
      Color color,
      Color textColor,
      Color iconColor,
      VoidCallback onPressed})
      : assert(icon != null),
        assert(text != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FaIcon(
                  icon,
                  color: iconColor,
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
