class Validators {
  static final _emailRegex = RegExp(r"^[\w.\-+]+@([\w\-]+\.)+[a-zA-Z]{2,}$");

  static String? name(String? value) {
    var name = value?.trim() ?? "";
    if (name.isEmpty) {
      return "name_required";
    }
    if (name.length < 3) {
      return "name_too_short";
    }
    return null;
  }

  static String? email(String? value) {
    var email = value?.trim() ?? "";
    if (email.isEmpty) {
      return "email_required";
    }
    if (!_emailRegex.hasMatch(email)) {
      return "email_invalid";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }
}
