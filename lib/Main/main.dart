import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:coin_main/tab_navigator.dart';

class MainPage extends StatefulWidget {
  final String id;
  final String pass;

  MainPage({this.id, this.pass});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  int _currentIndex = 0;
  String _currentPage = "homePage";
  List<String> pageKeys = ["homePage", "shortcutPage", "boardPage", "myPage"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "homePage": GlobalKey<NavigatorState>(),
    "shortcutPage": GlobalKey<NavigatorState>(),
    "boardPage": GlobalKey<NavigatorState>(),
    "myPage": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _currentIndex = index;
      });
    }
  }

  String id;
  String pass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id; //widget.id는 LogOutPage에서 전달받은 id를 의미한다.
    pass = widget.pass; //widget.pass LogOutPage에서 전달받은 pass 의미한다.
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return WillPopScope(

      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator("homePage"),
            _buildOffstageNavigator("shortcutPage"),
            _buildOffstageNavigator("boardPage"),
            _buildOffstageNavigator("myPage"),
          ],
        ),
        bottomNavigationBar: bottomNavi_(),
      ),
    );
  }

  Widget bottomNavi_() {
    return Container(
      height: height(70),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _selectTab(pageKeys[index], index);
        },
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
        child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
