/// `Validator` class allow to validate a value with
/// many predefined validation rules
class Validator {
  String value;

  Validator(
    this.value,
  );

  String email() {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(this.value) || this.value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  String password() {
    if (this.value.length > 10 || this.value.length < 6)
      return "Enter a valid password between 10 and 6 characters";
    else
      return null;
  }
}
