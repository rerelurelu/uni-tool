import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/provider/calculate_provider.dart';
import 'package:uni_tool/layout/theme.dart';

class HomeScreen extends StatelessWidget {
  final double _btnHeight = 50;
  final double _btnWidth = 100;
  final double _btnFontSize = 16;
  final double _formVertical = 12;
  final double _formHorizontal = 30;
  final Color _textColor = teal;
  final Color _formTextColor = sumi;
  final double _formFontSize = 18;

  final FocusNode _textNode1 = FocusNode();
  final FocusNode _textNode2 = FocusNode();
  final FocusNode _textNode3 = FocusNode();
  final FocusNode _textNode4 = FocusNode();

  final TextEditingController incrController = TextEditingController();
  final TextEditingController probController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: defaultColor,
        child: KeyboardActions(
          config: _keyboardActionConfig,
          tapOutsideToDismiss: false,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Consumer(builder: (context, watch, child) {
                    final calulator = watch(expectedValueProvider);

                    return Center(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(255, 255, 255, .5),
                            ),
                            child: Center(
                              child: Text(
                                calulator.expectedValue + '％',
                                style: TextStyle(
                                  color: lightTeal,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          calulator.hasError
                              ? Column(
                                  children: [
                                    SizedBox(height: 25),
                                    Container(
                                      child: Text(
                                        calulator.errorText,
                                        style: TextStyle(
                                          color: Colors.redAccent.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(height: 32),
                        ],
                      ),
                    );
                  }),
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
                        color: _formTextColor,
                        fontSize: _formFontSize,
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
                        color: _formTextColor,
                        fontSize: _formFontSize,
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
                        color: _formTextColor,
                        fontSize: _formFontSize,
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
                        hintText: 'スコア○％アップ',
                      ),
                      focusNode: _textNode4,
                      controller: incrController,
                      style: TextStyle(
                        color: _formTextColor,
                        fontSize: _formFontSize,
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
                                  color: _textColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            clearText();
                            context.read(expectedValueProvider).resetValue();
                            context.read(expectedValueProvider).changeHasError(false);
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
                                  color: _textColor,
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
                              context
                                  .read(expectedValueProvider)
                                  .calculate(interval, prob, time, incr);
                              context.read(expectedValueProvider).changeHasError(false);
                            } on FormatException {
                              context.read(expectedValueProvider).changeHasError(true);
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
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: fog,
        activeColor: deepBlue,
        color: lightPurple,
        initialActiveIndex: 0,
        elevation: 1,
        items: [
          TabItem(
            icon: Icons.calculate_rounded,
            title: '計算',
          ),
          TabItem(
            icon: Icons.settings_rounded,
            title: '設定',
          ),
        ],
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
