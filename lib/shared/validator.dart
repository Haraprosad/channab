class Validator {
  static bool isEmailValid(String inputEmail) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    bool emailValid = RegExp(pattern).hasMatch(inputEmail);
    if (!emailValid) {
      return false;
    } else
      return true;
  }
}
