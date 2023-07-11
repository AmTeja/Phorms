import 'package:flutter/material.dart';
import 'package:phorms/config/ecodes.dart';

abstract class PhromsSnackbar {
  final String message;
  final SnackBarAction? snackBarAction;
  final Color? backgroundColor;

  const PhromsSnackbar({
    required this.message,
    this.snackBarAction,
    this.backgroundColor,
  });

  SnackBar get snackBar => SnackBar(
        content: Text(message),
        action: snackBarAction,
        backgroundColor: backgroundColor,
      );
}

class PhromsErrorSnackbar extends PhromsSnackbar {
  const PhromsErrorSnackbar({
    required String message,
    SnackBarAction? snackBarAction,
    Color? backgroundColor,
  }) : super(
          message: message,
          snackBarAction: snackBarAction,
          backgroundColor: backgroundColor,
        );

  factory PhromsErrorSnackbar.fromECode(ECode eCode) {
    switch (eCode) {
      case ECode.INVALID_EMAIL_FORMAT:
        return const PhromsErrorSnackbar(message: 'Invalid email');
      case ECode.INVALID_PASSWORD_FORMAT:
        return const PhromsErrorSnackbar(message: 'Weak password');
      case ECode.USER_ALREADY_EXISTS:
        return const PhromsErrorSnackbar(message: 'Email already in use');
      case ECode.USER_DOES_NOT_EXIST:
        return const PhromsErrorSnackbar(message: 'User not found');
      case ECode.INCORRECT_CREDENTIALS:
        return const PhromsErrorSnackbar(message: 'Wrong password');

      case ECode.UNAUTHORIZED:
        return const PhromsErrorSnackbar(message: 'Unauthorized');
      default:
        return const PhromsErrorSnackbar(
            message: 'Something went wrong, try again later');
    }
  }
}
