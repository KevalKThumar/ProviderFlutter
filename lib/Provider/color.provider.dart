import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  String name = "red";
  Color color = Colors.red;
  bool isSelect = false;
  Brightness brightness = Brightness.dark;

  Color get currentColor => color;
  String get getname => name;
  bool get getselect => isSelect;
  Brightness get getbrightness => brightness;

  void changeBrightness() {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    notifyListeners();
  }

  void changeSelect() {
    isSelect = !isSelect;
    notifyListeners();
  }

  void changeColor(Color c) {
    color = c;
    notifyListeners();
  }

  void changeName(String c) {
    name = c;
    notifyListeners();
  }
}
