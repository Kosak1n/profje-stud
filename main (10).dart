class PasswordValidator {
  static const int minLength = 8;

  static bool validate(String password) {
    bool hasDigit = password.contains(RegExp(r'\d'));
    return password.length >= minLength && hasDigit;
  }
}

void main() {
  String password = "pass1234";

  if (PasswordValidator.validate(password)) {
    print("Пароль корректный");
  } else {
    print("Пароль не соответствует требованиям");
  }
}