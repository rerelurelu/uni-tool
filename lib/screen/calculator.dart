import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/layout/theme.dart';
import 'package:uni_tool/provider/calculate_provider.dart';
import 'package:uni_tool/provider/change_mode_provider.dart';
import '../layout/global.dart';

class calculatorScreen extends ConsumerWidget {
  final FocusNode _textNode1 = FocusNode();
  final FocusNode _textNode2 = FocusNode();
  final FocusNode _textNode3 = FocusNode();
  final FocusNode _textNode4 = FocusNode();

  final TextEditingController incrController = TextEditingController();
  final TextEditingController probController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Widget build(BuildContext context, ScopedReader watch) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    /* Widget sizes */
    final double _formVertical = deviceHeight * 0.015;
    final double _formHorizontal = deviceWidth * 0.08;
    final double _btnFontSize = 16;

    final double _btnHeight =
        deviceHeight > deviceWidth ? deviceHeight * 0.06 : deviceHeight * 0.15;
    final double _btnWidth = deviceHeight > deviceWidth ? deviceWidth * 0.3 : deviceHeight * 0.5;

    /* Providers */
    final calculator = watch(expectedValueProvider);
    final calculatorMode = watch(changeModeProvider);

    return Container(
      decoration: defaultColor,
      child: KeyboardActions(
        config: _keyboardActionConfig,
        tapOutsideToDismiss: false,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 255, 255, .5),
                  ),
                  child: Center(
                    child: Text(
                      calculator.expectedValue + '％',
                      style: TextStyle(
                        color: lightTeal,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                calculator.hasError
                    ? Column(
                        children: [
                          SizedBox(height: 25),
                          Container(
                            child: Text(
                              calculator.errorText,
                              style: TextStyle(
                                color: Colors.redAccent.shade700,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _formVertical,
                    horizontal: _formHorizontal,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '計算モード',
                            style: TextStyle(
                              color: textColor,
                              fontSize: formFontSize,
                            ),
                          ),
                          FlutterSwitch(
                            activeText: 'スコア',
                            inactiveText: 'コンボ',
                            valueFontSize: 17,
                            width: 110,
                            borderRadius: 30,
                            showOnOff: true,
                            value: calculatorMode.isScoreMode,
                            activeColor: lapis,
                            inactiveColor: coral,
                            onToggle: (value) {
                              calculatorMode.changeMode();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _formVertical,
                    horizontal: _formHorizontal,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '○秒おきに',
                    ),
                    focusNode: _textNode1,
                    controller: intervalController,
                    style: TextStyle(
                      color: formTextColor,
                      fontSize: formFontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _formVertical,
                    horizontal: _formHorizontal,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '○％の確率で',
                    ),
                    focusNode: _textNode2,
                    controller: probController,
                    style: TextStyle(
                      color: formTextColor,
                      fontSize: formFontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _formVertical,
                    horizontal: _formHorizontal,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '○秒間',
                    ),
                    focusNode: _textNode3,
                    controller: timeController,
                    style: TextStyle(
                      color: formTextColor,
                      fontSize: formFontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _formVertical,
                    horizontal: _formHorizontal,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: calculatorMode.isScoreMode ? 'スコア○％アップ' : 'コンボボーナス○％アップ',
                    ),
                    focusNode: _textNode4,
                    controller: incrController,
                    style: TextStyle(
                      color: formTextColor,
                      fontSize: formFontSize,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 24,
                      ),
                      child: InkWell(
                        customBorder: StadiumBorder(),
                        radius: 100,
                        splashColor: lightPurple,
                        child: Container(
                          height: _btnHeight,
                          width: _btnWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(255, 255, 255, .5),
                          ),
                          child: Center(
                            child: Text(
                              'リセット',
                              style: TextStyle(
                                fontSize: _btnFontSize,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          clearText();
                          calculator.resetValue();
                          calculator.changeHasError(false);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 24,
                      ),
                      child: InkWell(
                        customBorder: StadiumBorder(),
                        radius: 100,
                        splashColor: lightPurple,
                        child: Container(
                          height: _btnHeight,
                          width: _btnWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(255, 255, 255, .5),
                          ),
                          child: Center(
                            child: Text(
                              '計算する',
                              style: TextStyle(
                                fontSize: _btnFontSize,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          try {
                            int interval = int.parse(intervalController.value.text);
                            int prob = int.parse(probController.value.text);
                            int time = int.parse(timeController.value.text);
                            int incr = int.parse(incrController.value.text);

                            if (calculatorMode.isScoreMode) {
                              calculator.calculateScoreMode(interval, prob, time, incr);
                            } else {
                              calculator.calculateComboMode(interval, prob, time, incr);
                            }

                            calculator.changeHasError(false);
                          } on FormatException {
                            calculator.changeHasError(true);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  get _keyboardActionConfig {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardSeparatorColor: Color.fromRGBO(255, 255, 255, .3),
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _textNode1),
        KeyboardActionsItem(focusNode: _textNode2),
        KeyboardActionsItem(focusNode: _textNode3),
        KeyboardActionsItem(focusNode: _textNode4),
      ],
    );
  }

  void clearText() {
    intervalController.clear();
    probController.clear();
    timeController.clear();
    incrController.clear();
  }
}
