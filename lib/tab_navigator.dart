import 'package:flutter/material.dart';
import 'First_screen/homePage.dart';
import 'Four_screen/myPage.dart';
import 'Second_screen/shortcutPage.dart';
import 'Third_screen/boardPage.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  final String tabItem;
  final GlobalKey<NavigatorState> navigatorKey;

  TabNavigator({this.tabItem, this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "homePage") {
      child = homePage();
    } else if (tabItem == "shortcutPage")
      child = shortcutPage();
    else if (tabItem == "boardPage")
      child = boardPage();
    else if (tabItem == "myPage")
      child = myPage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}