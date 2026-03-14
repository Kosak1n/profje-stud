import 'dart:math';

class MathProcessor {
  List<double> numbers;

  MathProcessor(this.numbers);

  List<double> process(double Function(double) handler) {
    List<double> result = [];

    for (double num in numbers) {
      result.add(handler(num));
    }

    return result;
  }

  static List<double> getRandomNumbers(int count) {
    Random random = Random();
    List<double> numbers = [];

    for (int i = 0; i < count; i++) {
      numbers.add(random.nextDouble() * 100);
    }

    return numbers;
  }
}

void main() {
  List<double> nums = MathProcessor.getRandomNumbers(5);

  print("Исходные числа: $nums");

  MathProcessor processor = MathProcessor(nums);

  List<double> squared = processor.process((x) => x * x);

  print("Квадраты чисел: $squared");
}