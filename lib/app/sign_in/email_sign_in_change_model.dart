import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker_flutter/app/sign_in/validators.dart';
import 'package:time_tracker_flutter/services/auth.dart';

class EmailSignInChangeModel with EmailAndPasswordValidator, ChangeNotifier {
  EmailSignInChangeModel(
      {@required this.auth,
      this.email = '',
      this.password = '',
      this.formType = EmailSignInFormType.signIn,
      this.submitted = false,
      this.loading = false});

  final AuthBase auth;
  String email;
  String password;
  EmailSignInFormType formType;
  bool submitted;
  bool loading;

  Future<void> submit() async {
    updateWith(loading: true, submitted: true);
    try {
      if (this.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(this.email, this.password);
      } else {
        await auth.registerWithEmailAndPassword(this.email, this.password);
      }
    } catch (e) {
      updateWith(loading: false);
      rethrow;
    }
  }

  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn ? 'Sign in' : 'Create an account';
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn ? 'Need an account? Register' : 'Already have an account? Sign in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) && passwordValidator.isValid(password) && !loading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  void toggleFormType() {
    final formType =
        this.formType == EmailSignInFormType.signIn ? EmailSignInFormType.register : EmailSignInFormType.signIn;
    updateWith(email: '', password: '', formType: formType, loading: false, submitted: false);
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({String email, String password, EmailSignInFormType formType, bool loading, bool submitted}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.submitted = submitted ?? this.submitted;
    this.loading = loading ?? this.loading;

    notifyListeners();
  }
}
