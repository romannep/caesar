import 'dart:async';

import 'package:flutter/material.dart';

import 'db/db.dart';

void main() {
  runApp(const CaesarApp());
}

class CaesarApp extends StatefulWidget {
  const CaesarApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CaesarAppState();
}

class CaesarAppState extends State<CaesarApp> {
  bool initialized = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await Future.delayed(Duration(seconds: 2));
    await Db.instance.init();
    setState(() {
      initialized = true;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caesar',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: initialized ? MainScreen() : SplashScreen(),
      home: Scaffold(
        body: initialized ? MainScreen() : SplashScreen(),
      ),
    );
  }
}


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Loading');
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Main screen');
  }
}
