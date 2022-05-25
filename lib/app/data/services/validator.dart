class Validator {
  static String? validateEmployeeID(String employeeID) {
    if (employeeID.isEmpty) {
      return 'Please enter Employee ID KE';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter Password';
    }
    // if (password.length < 8) {
    //   return 'Password length should be atleast 8 characters';
    // }
    return null;
  }

  static String? validateFullname(String fullname) {
    if (fullname.isEmpty) {
      return 'Please enter Full Name';
    }
    return null;
  }

  static List<String?> validatePasswords(
      String password, String confirmPassword) {
    if (password.isEmpty) {
      return ['Please enter Password', null];
    }
    if (confirmPassword.isEmpty) {
      return [null, 'Please confirm password'];
    }
    // if (password.length < 8 && confirmPassword.length < 8) {
    //   return [
    //     'Password length should be atleast 8 characters',
    //     'Password length should be atleast 8 characters'
    //   ];
    // }
    if (password.length < 8) {
      return ['Password length should be atleast 8 characters', null];
    }

    if (password != confirmPassword) {
      return ['Passwords do not match', 'Passwords do not match'];
    }
    return [null, null];
  }

  static String? validateCNIC(String cnic) {
    if (cnic.isEmpty) {
      return 'Please enter CNIC Number';
    }
    if (cnic.length < 13) {
      return 'Invalid CNIC Number';
    }
    return null;
  }

  static String? validateMobile(String mobile) {
    if (mobile.isEmpty) {
      return 'Please enter Mobile Number';
    }
    if (mobile.length < 10) {
      return 'Invalid Mobile Number';
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

  static String? validateLocation(String location) {
    if (location.isEmpty) {
      return 'Please select Location';
    }
    return null;
  }

  static String? validatePost(String post) {
    if (post.isEmpty) {
      return 'Please enter Post text';
    }
    return null;
  }

  static String? validateOldPassword(String oldPassword, String actual) {
    if (oldPassword.isEmpty) {
      return 'Please enter old password';
    }
    if (actual != oldPassword) {
      return 'Invalid old password';
    }
    return null;
  }

  static String? validateDescription(String description) {
    if (description.isEmpty) {
      return 'Please enter Description text';
    }
    return null;
  }
}
