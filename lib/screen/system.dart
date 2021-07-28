import 'package:flutter/material.dart';
import 'package:uni_tool/layout/theme.dart';

class SystemScreen extends StatelessWidget {
  const SystemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: defaultColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              child: Text(
                'このアプリについて',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
