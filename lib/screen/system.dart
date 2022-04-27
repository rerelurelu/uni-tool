import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/layout/global.dart';
import 'package:uni_tool/layout/theme.dart';
import 'package:uni_tool/provider/get_app_version_provider.dart';
import 'package:uni_tool/screen/disclaimer.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final appVersion = watch(getAppVersionProvider).data?.value;

    return Container(
      decoration: defaultColor,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: const Text(
              'アプリについて',
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            color: fog,
            elevation: 0,
            child: Column(
              children: [
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: const Text(
                      'バージョン',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: Text(
                      appVersion ?? 'Unknown',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                _dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: const Text(
                      'アプリの使い方',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: textColor,
                    ),
                  ),
                  onTap: () {
                    launchHowToUseURL(context);
                  },
                ),
                _dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: const Text(
                      'プライバシーポリシー',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: textColor,
                    ),
                  ),
                  onTap: () {
                    launchPolicyURL(context);
                  },
                ),
                _dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: Text(
                      '免責事項',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: textColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push<Object?>(
                      createRoute(
                        DisclaimerScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dividerPadding() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Divider(
        height: 1,
        thickness: 1,
      ),
    );
  }

  void launchPolicyURL(BuildContext context) async {
    final _url = 'https://www.zoniha.icu/policy';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      return showAlertDialog(context, _url);
    }
  }

  void launchHowToUseURL(BuildContext context) async {
    final _url = 'https://www.zoniha.icu/blog/uni-tool';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      return showAlertDialog(context, _url);
    }
  }

  void showAlertDialog(BuildContext context, String url) {
    Widget closeButton = TextButton(
      child: Text('閉じる'),
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Sorry!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
      content: Text(
        '$url を開けませんでした',
        textAlign: TextAlign.center,
      ),
      actions: [
        closeButton,
      ],
    );

    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  Route<dynamic> createRoute(Widget nextScreen) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
