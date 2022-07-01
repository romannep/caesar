import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      return Text('Main screen: $orientation');
    });
  }
}
