import 'package:coin_main/Second_screen/shortcutPage.dart';
import 'package:coin_main/Third_screen/boardPage.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import '../First_screen/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Second_screen/google_drive.dart';
import '../Second_screen/github.dart';
import '../First_screen/qrcode.dart';
import '../Four_screen/myPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'alarm.dart';
import 'package:coin_main/First_screen/calendar.dart';
import 'package:coin_main/First_screen/product.dart';

class MainPage extends StatefulWidget {
  final String id;
  final String pass;
  MainPage({this.id, this.pass});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _List = [
    homePage(),
    shortcutPage(),
    boardPage(),
    myPage(),
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
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
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: SvgPicture.asset('images/coin_source/icon_sidebar_28px.svg'),
            padding: EdgeInsets.only(left: 10),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: Center(
          child: Image.asset('images/coin_source/LOGO.png'),
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset('images/coin_source/icon_appbar_notification_28px.svg'),
              onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => alarm()));}
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: 2,
          ),
          preferredSize: Size.fromHeight(2),
        ),
      ),
      body: WillPopScope(
          onWillPop: _onWillPop,
          child: _List[_currentIndex]),
      drawer: Container(
        width: 272,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: DrawerHeader(
                  padding: EdgeInsets.fromLTRB(0, 21, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: IconButton(icon: Icon(Icons.close, size: 28), onPressed: (){}),
                        padding: EdgeInsets.fromLTRB(0, 0, 200, 10),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child:
                                    SvgPicture.asset('images/coin_source/icon_profile_designer_50px.svg'),
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.fromLTRB(14, 0, 0, 5),
                                        child: Text('권지수'),
                                      ),
                                      Container(
                                        child: Text('시각정보디자인과'),
                                        padding: EdgeInsets.only(left: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 33),
                              child: Icon(Icons.chevron_right, size: 28),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('Main'),
                onTap: () {},
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
              ),
              ListTile(
                title: Text('공지사항'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {},
              ),
              ListTile(
                title: Text('캘린더'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(
                    title: '캘린더',
                  )));
                },
              ),
              ListTile(
                title: Text('출석'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QrcodeScan()));},
              ),
              ListTile(
                title: Text('비품관리'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => productManage()));},
              ),
              ListTile(
                title: Text('게시판'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => boardPage()));},
              ),
              ListTile(
                title: Text('Google Drive'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleDrive()));},
              ),
              ListTile(
                title: Text('Git?'),
                contentPadding: EdgeInsets.only(left: 25),
                visualDensity: VisualDensity(vertical: -3),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GitHub()));},
              ),
              ListTile(
                title: Text('logout'),
                contentPadding: EdgeInsets.only(left: 25),
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
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[400],
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: SvgPicture.asset('images/coin_source/icon_home_30px.svg'),
              label: '',
            ),
            new BottomNavigationBarItem(
              icon: SvgPicture.asset('images/coin_source/icon_shortcut_30px.svg'),
              label: '',
            ),
            new BottomNavigationBarItem(
              icon: SvgPicture.asset('images/coin_source/icon_board_30px.svg'),
              label: '',
            ),
            new BottomNavigationBarItem(
              icon: SvgPicture.asset('images/coin_source/icon_mypage_30px.svg'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}