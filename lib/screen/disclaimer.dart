import 'package:flutter/material.dart';
import 'package:uni_tool/layout/color.dart';

class DisclaimerScreen extends StatelessWidget {
  DisclaimerScreen({Key? key}) : super(key: key);

  final String _paragraphOne = "本アプリは公式のものではありません。公式アプリ「櫻坂46・日向坂46UNI'S ON AIR」とは一切関係はありません。";
  final String _paragraphTwo = "本アプリは提供しているデータの信頼性を保証できません。アプリのご利用におけるリスクについて、開発者は一切の責任を負いません。";

  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('免責事項'),
        backgroundColor: lightPurple,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                _paragraphOne,
                style: _textStyle,
              ),
              const SizedBox(height: 20),
              Text(
                _paragraphTwo,
                style: _textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
