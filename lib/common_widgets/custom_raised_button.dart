import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRaiseButton extends StatelessWidget {
  CustomRaiseButton(
      {this.child,
      this.color,
      this.borderRadius: 5.0,
      this.height: 50,
      this.onPressed});
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      child: RaisedButton(
        color: this.color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(this.borderRadius))),
        child: this.child,
        onPressed: this.onPressed,
      ),
    );
  }
}
