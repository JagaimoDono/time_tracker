import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/sign_in/email_sign_in_form.dart';
import 'package:time_tracker_flutter/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Card(
            child: EmailSignInForm(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
