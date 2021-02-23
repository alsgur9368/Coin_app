import 'package:coin_main/Third_screen/boardPage.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Second_screen/google_drive.dart';
import '../Second_screen/github.dart';
import '../First_screen/qrcode.dart';
import '../Four_screen/myPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:coin_main/tab_navigator.dart';
import 'package:coin_main/First_screen/calendar.dart';
import 'package:coin_main/productManagement.dart';

class MainPage extends StatefulWidget {
  final String id;
  final String pass;

  MainPage({this.id, this.pass});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height(double value) {
    return MediaQuery
        .of(context)
        .size
        .height * (value / 812);
  }

  double width(double value) {
    return MediaQuery
        .of(context)
        .size
        .width * (value / 375);
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

  static final storage = FlutterSecureStorage();
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
      builder: (context) =>
      new AlertDialog(
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
          drawer: Container(
            width: width(252),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: height(180),
                    child: DrawerHeader(
                      margin: EdgeInsets.only(left: width(16), right: width(16)),
                      padding: EdgeInsets.fromLTRB(0, height(15), 0, 0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: Divider.createBorderSide(context,
                                  color: Color(0xffDBDBDB)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: height(5)),
                            child: IconButton(
                                icon: Icon(Icons.close, size: height(28)),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myPage()));
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: height(10)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: SvgPicture.asset(
                                            'images/coin_source/icon_profile_designer_50px.svg',
                                            width: height(50)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                width(14), 0, 0, height(5)),
                                            child: Text('권지수',
                                                style: TextStyle(
                                                    fontSize: height(14))),
                                          ),
                                          Container(
                                            child: Text('시각정보디자인과',
                                                style: TextStyle(
                                                    fontSize: height(14))),
                                            padding:
                                            EdgeInsets.only(left: width(14)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: width(23)),
                                  child:
                                  Icon(Icons.chevron_right, size: height(24)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Main', style: TextStyle(fontSize: height(14))),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                  ),
                  ListTile(
                    title: Text('공지사항', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('캘린더', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                title: '캘린더',
                              )));
                    },
                  ),
                  ListTile(
                    title: Text('출석', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QrcodeScan()));
                    },
                  ),
                  ListTile(
                    title: Text('비품관리', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => productManage()));
                    },
                  ),
                  ListTile(
                    title: Text('게시판', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => boardPage()));
                    },
                  ),
                  ListTile(
                    title: Text('Google Drive',
                        style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GoogleDrive()));
                    },
                  ),
                  ListTile(
                    title: Text('Git', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GitHub()));
                    },
                  ),
                  ListTile(
                    title: Text('logout', style: TextStyle(fontSize: height(14))),
                    contentPadding: EdgeInsets.only(left: width(25)),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {
                      storage.delete(key: "login");
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => MyLoginPage(
                              title: "Login Page",
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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

        onWillPop: () async {
          final isFirstRouteInCurrentTab =
          !await _navigatorKeys[_currentPage].currentState.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (_currentPage != "Page1") {
              _selectTab("Page1", 1);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        });

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

  Widget _buildOffstageNavigator(String tabItem){
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

}
