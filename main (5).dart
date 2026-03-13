import 'dart:io';

void main() {
  stdout.write("Введите первое число: ");
  double? num1 = double.tryParse(stdin.readLineSync() ?? '');
  
  stdout.write("Введите второе число: ");
  double? num2 = double.tryParse(stdin.readLineSync() ?? '');

  if (num1 == null || num2 == null) {
    print("Ошибка: введено не число!");
    return; 
  }

  stdout.write("Введите оператор (+, -, *, /, %): ");
  String? op = stdin.readLineSync();

  String operator = op?.trim() ?? '';
  double? result;

  if (operator == '+') {
    result = num1 + num2;
  } else if (operator == '-') {
    result = num1 - num2;
  } else if (operator == '*') {
    result = num1 * num2;
  } else if (operator == '/') {
    result = (num2 != 0) ? num1 / num2 : null; 
  } else if (operator == '%') {
    result = (num2 != 0) ? num1 % num2 : null; 
  } else {
    print("Ошибка: некорректный оператор!");
    return;
  }

  print(result != null
      ? "Результат: $num1 $operator $num2 = $result"
      : "Ошибка: деление на ноль невозможно!");
}