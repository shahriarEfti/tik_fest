class AppConstants {
  static final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Updated to support Bangladesh phone numbers (+880 followed by 9 digits)
  static final RegExp phoneRegExp = RegExp(r'^\+8801[3-9][0-9]{8}$');

  static RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
  );
}
