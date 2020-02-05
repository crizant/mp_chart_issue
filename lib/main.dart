import 'package:flutter/material.dart';

import 'chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(
                child: Text('Some Content'),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Chart(),
            ),
          ],
        ),
      ),
    );
  }
}
