import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/layout/global.dart';
import 'package:uni_tool/layout/theme.dart';
import 'package:uni_tool/provider/get_app_version_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final appVersion = watch(getAppVersionProvider).data?.value;

    return Container(
      decoration: defaultColor,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
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
                    title: Text(
                      'バージョン',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: Text(
                      appVersion ?? 'Unknown',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: Text(
                      'アプリの使い方',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: textColor,
                    ),
                  ),
                  onTap: () {
                    launchHowToUseURL(context);
                  },
                ),
                dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: ListTile(
                    title: Text(
                      'プライバシーポリシー',
                      style: TextStyle(color: textColor),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: textColor),
                  ),
                  onTap: () {
                    launchPolicyURL(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dividerPadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Divider(
        height: 1,
        thickness: 1,
      ),
    );
  }

  void launchPolicyURL(BuildContext context) async {
    final _url = 'https://www.zaw.icu/policy';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      return showAlertDialog(context, _url);
    }
  }

  void launchHowToUseURL(BuildContext context) async {
    final _url = 'https://zaw.vercel.app/policy';
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

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
