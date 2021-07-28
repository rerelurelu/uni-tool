import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeModeProvider = ChangeNotifierProvider(
  (ref) => ChangeMode(),
);

class ChangeMode extends ChangeNotifier {
  bool isScoreMode = true;

  void changeMode() {
    isScoreMode = !isScoreMode;
    notifyListeners();
  }
}
