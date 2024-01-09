import 'package:flutter/material.dart';

// {'title': "Test", 'subtitle': "test"},

class CatelogProvider extends ChangeNotifier {
  final List items = [];
  num total = 0;

  void add(item) {
    items.add(item);
    total += item['price'];
    notifyListeners();
  }

  void remove(item) {
    items.remove(item);
    total -= item['price'];
    notifyListeners();
  }
}
