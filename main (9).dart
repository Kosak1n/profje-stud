import 'dart:math';

abstract class Shape {

  Shape(); // базовый конструктор

  double area();

  factory Shape.fromJson(Map<String, dynamic> json) {
    if (json["type"] == "circle") {
      return Circle(json["radius"]);
    } else if (json["type"] == "rectangle") {
      return Rectangle(json["width"], json["height"]);
    } else {
      throw Exception("Неизвестный тип фигуры");
    }
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius) : super();

  @override
  double area() {
    return pi * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height) : super();

  @override
  double area() {
    return width * height;
  }
}

void main() {

  Map<String, dynamic> circleJson = {
    "type": "circle",
    "radius": 5
  };

  Map<String, dynamic> rectangleJson = {
    "type": "rectangle",
    "width": 4,
    "height": 6
  };

  Shape circle = Shape.fromJson(circleJson);
  Shape rectangle = Shape.fromJson(rectangleJson);

  print("Площадь круга: ${circle.area()}");
  print("Площадь прямоугольника: ${rectangle.area()}");
}