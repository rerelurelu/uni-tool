import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/layout/theme.dart';
import 'package:uni_tool/provider/get_app_version_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemScreen extends ConsumerWidget {
  final _url = 'https://zaw.vercel.app/policy/';

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
            child: const Text(
              'アプリについて',
              style: TextStyle(fontSize: 24),
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
                    title: const Text('バージョン'),
                    trailing: Text(appVersion ?? 'Unknown'),
                  ),
                  onTap: () {},
                ),
                dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: const ListTile(
                    title: const Text('アプリの使い方'),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  onTap: launchURL,
                ),
                dividerPadding(),
                InkWell(
                  splashColor: lightFog,
                  child: const ListTile(
                    title: const Text('プライバシーポリシー'),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  onTap: launchURL,
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

  void launchURL() async => await canLaunch(_url) ? await launch(_url) : throw '$_urlを開けませんでした';
}
