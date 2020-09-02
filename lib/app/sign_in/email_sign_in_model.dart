import 'package:time_tracker_flutter/app/sign_in/validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInModel with EmailAndPasswordValidator {
  EmailSignInModel(
      {this.email = '',
      this.password = '',
      this.formType = EmailSignInFormType.signIn,
      this.submitted = false,
      this.loading = false});

  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool submitted;
  final bool loading;

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

  EmailSignInModel copyWith(
      {String email, String password, EmailSignInFormType formType, bool loading, bool submitted}) {
    return EmailSignInModel(
        email: email ?? this.email,
        password: password ?? this.password,
        formType: formType ?? this.formType,
        submitted: submitted ?? this.submitted,
        loading: loading ?? this.loading);
  }
}
