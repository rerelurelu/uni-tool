import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uni_tool/layout/theme.dart';
import 'package:uni_tool/screen/home.dart';

void main() {
  runApp(
    ProviderScope(
      child: UniTool(),
    ),
  );
}

class UniTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ゆにつーる',
      theme: defaultTheme,
      home: HomeScreen(),
    );
  }
}
