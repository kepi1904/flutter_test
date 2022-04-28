import 'package:flutter/material.dart';

class Money extends ChangeNotifier {
  late double _balance;

  Money() {
    _balance = 15000;
  }

  double get balance => _balance;

  set balance(double value) {
    _balance = value;
    notifyListeners();
  }
}
