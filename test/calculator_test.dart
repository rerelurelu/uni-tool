import 'package:flutter_test/flutter_test.dart';

import 'package:uni_tool/provider/calculate_provider.dart';

void main() {
  /* Calculation Score result */
  test('Score mode-1', () {
    final calculator = Calculate();
    calculator.calculateScoreMode(7, 28, 6, 19);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '3.68');
  });

  test('Score mode-2', () {
    final calculator = Calculate();
    calculator.calculateScoreMode(8, 16, 5, 19);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '1.73');
  });

  test('Score mode-3', () {
    final calculator = Calculate();
    calculator.calculateScoreMode(11, 11, 10, 12);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '1.09');
  });

  /* Calculation Combo result */
  test('Combo mode-1', () {
    final calculator = Calculate();
    calculator.calculateComboMode(9, 18, 9, 34);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '1.73');
  });

  test('Combo mode-2', () {
    final calculator = Calculate();
    calculator.calculateComboMode(9, 18, 7, 19);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '0.78');
  });

  test('Combo mode-3', () {
    final calculator = Calculate();
    calculator.calculateComboMode(9, 20, 9, 45);
    var exvalue = calculator.getExvalue;
    expect(exvalue, '2.50');
  });

  /* Reset Exvalue */
  test('Reset Exvalue', () {
    final calculator = Calculate();
    calculator.calculateScoreMode(7, 28, 6, 19);
    calculator.resetValue();
    var exvalue = calculator.getExvalue;
    expect(exvalue, '0.00');
  });
}
