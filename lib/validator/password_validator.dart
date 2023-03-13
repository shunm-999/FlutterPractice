class PasswordValidator {
  static bool validate(String? value) {
    if (value == null) {
      return false;
    }

    return RegExp(r'^[a-zA-Z0-9.?/-]{8,24}$').hasMatch(value);
  }
}
