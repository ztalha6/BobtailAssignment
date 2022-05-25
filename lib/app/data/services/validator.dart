class Validator {
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter Password';
    }
    return null;
  }

  static String? validateEmail(String emailAddress) {
    if (emailAddress.isEmpty) {
      return 'Please enter Email Address';
    }
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(emailAddress) &&
            !emailAddress.contains(" ");
    if (!emailValid) {
      return 'Please enter valid Email Address';
    }
    return null;
  }
}
