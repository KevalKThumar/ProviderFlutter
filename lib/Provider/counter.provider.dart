import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void increment() {
    if (_counter < 10) {
      _counter++;
    } else {
      _counter = _counter;
    }

    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
    } else {
      _counter = _counter;
    }
    notifyListeners();
  }
}
