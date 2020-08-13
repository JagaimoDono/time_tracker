import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_flutter/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog(
      {@required String title, @required PlatformException exception})
      : super(
            title: title,
            content: _message(exception),
            defaultActionText: 'OK');

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_INVALID_EMAIL': 'Invalid email',
    'ERROR_USER_NOT_FOUND': 'User not found',
    'ERROR_WRONG_PASSWORD': 'Wrong Email - Password Combination',
    'ERROR_TOO_MANY_REQUESTS': 'Too many requests',
    'ERROR_OPERATION_NOT_ALLOWED': 'Not allowed',
    'ERROR_USER_DISABLED': 'User Disabled'
  };
}
