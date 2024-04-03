class Validator {
  String validateName(String value) {
    var pattern = r'(^[a-zA-Z ]*$)';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Name is Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Name must be a-z and A-Z';
    }
    return '';
  }

  String validateMobile(String value) {
    var pattern = r'(^[0-9]*$)';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Mobile is Required';
    } else if (value.length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'Mobile Number must be digits';
    }
    return '';
  }

  String validatePassword(String value) {
    var pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must have 1 UPPER CASE, 1 LOWER CASE , 1 NUMERIC & 1 SPECIAL CHARACTER (! @ # \$ & * ~)';
    }
    return '';
  }

  String validateEmail(String value) {
    var pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    var regExp = RegExp(pattern);
    if (value.isEmpty || value == '') {
      return 'email_is_required';
    } else if (!regExp.hasMatch(value)) {
      return 'please_enter_valid_email';
    } else {
      return '';
    }
  }
}
