String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  }

  final emailRegex =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  if (!emailRegex.hasMatch(value)) {
    return 'Invalid email address';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }

  if (value.length < 8) {
    return 'Password must be of atleast 8 length';
  }

  final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  if (!passwordRegex.hasMatch(value)) {
    return 'Password must be alphanumeric with atleast one capital letter';
  }
  return null;
}
