class AppConstants {
  static final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Updated to support Bangladesh phone numbers (+880 followed by 9 digits)
  static final RegExp phoneRegExp = RegExp(r'^\+8801[3-9][0-9]{8}$');

  static RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
  );
}
String? validatePassword(String? value) {
  if (value?.trim().isEmpty ?? true) {
    return 'Enter your password';
  }
  if (!AppConstants.passwordRegExp.hasMatch(value!)) {
    return 'Password must be at least 8 characters, include uppercase, lowercase, number & special character.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value?.trim().isEmpty ?? true) {
    return 'Enter Your Email';
  }
  if (!AppConstants.emailRegExp.hasMatch(value!)) {
    return 'Enter a valid Email';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value?.trim().isEmpty ?? true) {
    return 'Enter Phone Number';
  }
  if (!AppConstants.phoneRegExp.hasMatch(value!)) {
    return 'Enter a valid Phone number';
  }
  return null;
}