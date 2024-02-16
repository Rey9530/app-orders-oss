class Validation {
  // ========== email validation ==========

  static String? emailvalidation({value, errortext}) {
    if (value == null || value.isEmpty) {
      return errortext;
    }
    return null;
  }

// ========== password validation ==========
  static String? passwordvalidation({value, errortext}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter valid password';
    }
    // the password is valid
    return null;
  }

// ========== normal validation ==========

  static String? normalvalidation({value, errortext}) {
    if (value == null || value.isEmpty) {
      return errortext;
    }

    // the password is valid
    return null;
  }

  // ========== Phone Number validation ==========

  static String? phonenumbervalidation(value) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
    return null;
  }

  // ========== Password validation ==========

  static String? createpasswordvalidation({value, errortext}) {
    if (value!.isEmpty) {
      return errortext;
    }
    return null;
  }

  // ========== Password validation ==========

  static String? createconfirmpasswordvalidation({value, password, errortext}) {
    if (value!.isEmpty) {
      return errortext;
    }
    if (value != password.text) {
      return 'Not Match Password';
    }
    return null;
  }
}
