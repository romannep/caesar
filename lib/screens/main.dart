import 'package:caesar/consts.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainState();
}

class MenuItem {
  Screen screen;
  String title;
  Icon icon;
  void Function(Screen screen) action;

  MenuItem({
    required this.screen,
    required this.title,
    required this.icon,
    required this.action,
  });

  Widget widget(Screen currentScreen) {
    return ElevatedButton(
      onPressed: () => action(screen),
      child: Row(
        children: [
          icon,
          Text('$title (c=${currentScreen == screen})'),
        ],
      ),
    );
  }
}


class MainState extends State<MainScreen> {

  Screen currentScreen = Screen.Desktop;

  late List<MenuItem> menu = [
    MenuItem(screen: Screen.Add, title: t('add'), icon: Icon(Icons.add), action: open),
    MenuItem(screen: Screen.Desktop, title: t('desktop'), icon: Icon(Icons.home), action: open),
  ];

  open(Screen screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      if (orientation == Orientation.portrait) {
        return Text('Under construction');
      } else {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: PRIMARY_COLOR,
              child: Column(
                children: menu.map((e) => e.widget(currentScreen)).toList(),
              ),
            ),
            Expanded(
                child: Text('Main content = $currentScreen'),
            ),
          ],
        );
      }
    });
  }

}
