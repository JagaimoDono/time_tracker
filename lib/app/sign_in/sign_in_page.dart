import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter/services/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFaceBook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithEmail(BuildContext context) async {
    //TODO Show email sign in page
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0,
            child: _buildHeader(),
          ),
          SizedBox(
            height: 40,
          ),
          SocialSignInButton(
            text: 'Sign in with Google',
            icon: FontAwesomeIcons.google,
            textColor: Colors.black87,
            iconColor: Colors.redAccent[400],
            color: Colors.white,
            onPressed: _isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(
            height: 10,
          ),
          SocialSignInButton(
            text: 'Sign in with Facebook',
            icon: FontAwesomeIcons.facebook,
            textColor: Colors.white,
            iconColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: _isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: _isLoading ? null : () => _signInWithEmail(context),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Sign in anonymously',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _isLoading ? null : () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    );
  }
}
