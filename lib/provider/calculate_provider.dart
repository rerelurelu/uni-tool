import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expectedValueProvider = ChangeNotifierProvider(
  (ref) => Calculate(),
);

class Calculate extends ChangeNotifier {
  static String defaultValue = '0.00';
  String expectedValue = defaultValue;
  String get getExvalue => expectedValue;

  final String errorText = '半角数字を入力してください';
  String get getErrorText => errorText;

  bool hasError = false;
  bool get getHasError => hasError;

  void calculate(int interval, int prob, int time, int incr) {
    /*
     * incr -> スコア○％アップ
     * prob -> ○％の確率で
     * interval -> ○秒おきに
     * time -> ○秒間
     */
    double result =
        incr * (prob / 100 * time) / ((interval + time) * prob / 100 + interval * (1 - prob / 100));

    expectedValue = result.toStringAsFixed(2);
    notifyListeners();
  }

  void resetValue() {
    expectedValue = defaultValue;
    notifyListeners();
  }

  void changeHasError(bool occur) {
    occur ? hasError = true : hasError = false;
    notifyListeners();
  }
}
