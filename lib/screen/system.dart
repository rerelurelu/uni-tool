import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:uni_tool/layout/color.dart';

import 'package:uni_tool/layout/theme.dart';

class SystemScreen extends StatelessWidget {
  const SystemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: defaultColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(18),
              child: SettingsList(
                backgroundColor: lightFog,
                shrinkWrap: true,
                sections: [
                  SettingsSection(
                    title: 'このアプリについて',
                    titleTextStyle: TextStyle(fontSize: 18),
                    tiles: [
                      SettingsTile(
                        title: 'バージョン',
                        trailing: Text('1.0.0'),
                      ),
                      SettingsTile(
                        title: 'アプリの使い方',
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      SettingsTile(
                        title: 'プライバシーポリシー',
                        titleTextStyle: TextStyle(fontSize: 15),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
