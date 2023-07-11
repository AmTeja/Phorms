// ignore_for_file: constant_identifier_names

enum ECode {
  NO_ERROR,
  DEFAULT_BAD_REQUEST,
  UNAUTHORIZED,
  EXPIRED_TOKEN,
  INTERNAL_SERVER_ERROR,
  EMAIL_AND_PASSWORD_FORMAT_INVALID,
  EMAIL_AND_PASSWORD_REQUIRED,
  INVALID_EMAIL_FORMAT,
  INVALID_PASSWORD_FORMAT,
  PASSWORD_LENGTH_TOO_SHORT,
  PASSWORD_LENGTH_TOO_LONG,
  USER_ALREADY_EXISTS,
  USER_DOES_NOT_EXIST,
  INCORRECT_CREDENTIALS,
  PROFILE_NOT_FOUND,
  PROFILE_INCOMPLETE,
  DISPLAY_NAME_TOO_LONG,
  DISPLAY_NAME_TOO_SHORT,
  USERNAME_ALREADY_TAKEN,
  USERNAME_TOO_LONG,
  USERNAME_TOO_SHORT,
  DISPLAY_PICTURE_UNFILLED,
  PROFILE_ALREADY_EXISTS
}

extension ECodeId on ECode {
  int get id {
    switch (this) {
      case ECode.NO_ERROR:
        return -1;
      case ECode.DEFAULT_BAD_REQUEST:
        return 400;
      case ECode.UNAUTHORIZED:
        return 401;
      case ECode.EXPIRED_TOKEN:
        return 402;
      case ECode.INTERNAL_SERVER_ERROR:
        return 999;
      case ECode.EMAIL_AND_PASSWORD_FORMAT_INVALID:
        return 100;
      case ECode.EMAIL_AND_PASSWORD_REQUIRED:
        return 101;
      case ECode.INVALID_EMAIL_FORMAT:
        return 102;
      case ECode.INVALID_PASSWORD_FORMAT:
        return 103;
      case ECode.PASSWORD_LENGTH_TOO_SHORT:
        return 104;
      case ECode.PASSWORD_LENGTH_TOO_LONG:
        return 105;
      case ECode.USER_ALREADY_EXISTS:
        return 106;
      case ECode.USER_DOES_NOT_EXIST:
        return 107;
      case ECode.INCORRECT_CREDENTIALS:
        return 108;
      case ECode.PROFILE_NOT_FOUND:
        return 118;
      case ECode.PROFILE_INCOMPLETE:
        return 119;
      case ECode.DISPLAY_NAME_TOO_LONG:
        return 121;
      case ECode.DISPLAY_NAME_TOO_SHORT:
        return 122;
      case ECode.USERNAME_ALREADY_TAKEN:
        return 124;
      case ECode.USERNAME_TOO_LONG:
        return 125;
      case ECode.USERNAME_TOO_SHORT:
        return 126;
      case ECode.DISPLAY_PICTURE_UNFILLED:
        return 127;
      case ECode.PROFILE_ALREADY_EXISTS:
        return 128;
      default:
        return -1;
    }
  }

  String get message {
    switch (this) {
      case ECode.NO_ERROR:
        return 'No Error';
      case ECode.DEFAULT_BAD_REQUEST:
        return 'Bad Request';
      case ECode.UNAUTHORIZED:
        return 'Unauthorized';
      case ECode.EXPIRED_TOKEN:
        return 'Expired Token';
      case ECode.INTERNAL_SERVER_ERROR:
        return 'Internal Server Error';
      case ECode.EMAIL_AND_PASSWORD_FORMAT_INVALID:
        return 'Email and Password Format Invalid';
      case ECode.EMAIL_AND_PASSWORD_REQUIRED:
        return 'Email and Password Required';
      case ECode.INVALID_EMAIL_FORMAT:
        return 'Invalid Email Format';
      case ECode.INVALID_PASSWORD_FORMAT:
        return 'Invalid Password Format';
      case ECode.PASSWORD_LENGTH_TOO_SHORT:
        return 'Password Length Too Short';
      case ECode.PASSWORD_LENGTH_TOO_LONG:
        return 'Password Length Too Long';
      case ECode.USER_ALREADY_EXISTS:
        return 'User Already Exists';
      case ECode.USER_DOES_NOT_EXIST:
        return 'User Does Not Exist';
      case ECode.INCORRECT_CREDENTIALS:
        return 'Incorrect Credentials';
      case ECode.PROFILE_NOT_FOUND:
        return 'Profile Not Found';
      case ECode.PROFILE_INCOMPLETE:
        return 'Profile Incomplete';
      case ECode.DISPLAY_NAME_TOO_LONG:
        return 'Display Name Too Long';
      case ECode.DISPLAY_NAME_TOO_SHORT:
        return 'Display Name Too Short';
      case ECode.USERNAME_ALREADY_TAKEN:
        return 'Username Already Taken';
      case ECode.USERNAME_TOO_LONG:
        return 'Username Too Long';
      case ECode.USERNAME_TOO_SHORT:
        return 'Username Too Short';
      case ECode.DISPLAY_PICTURE_UNFILLED:
        return 'Display Picture Unfilled';
      case ECode.PROFILE_ALREADY_EXISTS:
        return 'Profile Already Exists';
      default:
        return 'No Error';
    }
  }
}
