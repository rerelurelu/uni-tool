import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageTransitionProvider = ChangeNotifierProvider(
  (ref) => PageTransition(),
);

class PageTransition extends ChangeNotifier {
  int currentIndex = 0;

  void transition(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
