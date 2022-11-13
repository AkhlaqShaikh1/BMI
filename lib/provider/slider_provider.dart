import 'dart:math';

import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double height = 0;
  bool isMale = true;
  int age = 18;
  int weight = 60;
  Color selectedColor = const Color.fromARGB(255, 2, 39, 69);
  Color unselectedColor = const Color.fromARGB(255, 0, 13, 23);
  double bmi = 0;

  updateHeight(double value) {
    value = value.ceilToDouble();
    height = value;
    notifyListeners();
  }

  updateGender(bool male) {
    isMale = male;
    notifyListeners();
  }

  addW() {
    weight++;
    notifyListeners();
  }

  subW() {
    if (weight > 1) weight--;
    notifyListeners();
  }

  addAge() {
    age++;
    notifyListeners();
  }

  subAge() {
    if (age > 1) age--;
    notifyListeners();
  }

  calculateBMI() {
    bmi = (weight / pow(height, 2)) * 10000;
  }
}
