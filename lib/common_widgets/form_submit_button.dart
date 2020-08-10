import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/common_widgets/custom_raised_button.dart';

class FormSubmitButton extends CustomRaiseButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          height: 44,
          color: Colors.indigo,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
