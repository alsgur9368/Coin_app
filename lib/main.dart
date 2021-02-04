import 'package:coin_main/boardPage.dart';
import 'package:coin_main/shortcutPage.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'google_drive.dart';
import 'github.dart';
import 'qrcode.dart';
import 'myPage.dart';
import 'alarm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

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
          body: _List[_currentIndex],
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
                    onTap: () {},
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
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('게시판'),
                    contentPadding: EdgeInsets.only(left: 25),
                    visualDensity: VisualDensity(vertical: -3),
                    onTap: () {},
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
