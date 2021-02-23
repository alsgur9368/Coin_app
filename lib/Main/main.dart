import 'package:coin_main/Second_screen/shortcutPage.dart';
import 'package:coin_main/Third_screen/boardPage.dart';
import 'package:coin_main/notice.dart';
import '../createPost.dart';
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
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

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
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: SvgPicture.asset('images/coin_source/icon_sidebar_28px.svg'),
            padding: EdgeInsets.only(left: width(10)),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: Center(
          child: Image.asset('images/coin_source/logo_appbar.png'),
        ),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(right: width(10)),
              icon: _List[_currentIndex] == _List[2]
                  ? Icon(Icons.add_sharp, color: Colors.black, size: width(28))
                  : SvgPicture.asset(
                      'images/coin_source/icon_appbar_notification_28px.svg', width: width(28)),
              onPressed: () {
                if (_List[_currentIndex] == _List[2]) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => createPost()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => alarm()));
                }
              }),
        ],
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.fromLTRB(width(20), 0, width(20), 0),
            color: Color(0xffDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: WillPopScope(onWillPop: _onWillPop, child: _List[_currentIndex]),
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
                      bottom: Divider.createBorderSide(context, color: Color(0xffDBDBDB))
                    )
                  ),

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
                                        'images/coin_source/icon_profile_designer_50px.svg', width: height(50)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(width(14), 0, 0, height(5)),
                                        child: Text('권지수', style: TextStyle(fontSize: height(14))),
                                      ),
                                      Container(
                                        child: Text('시각정보디자인과', style: TextStyle(fontSize: height(14))),
                                        padding: EdgeInsets.only(left: width(14)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: width(23)),
                              child: Icon(Icons.chevron_right, size: width(24)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              listTile_("Main", homePage()),
              listTile_("공지사항", Notice()),
              listTile_("캘린더", MyHomePage(title: '캘린더')),
              listTile_("출석", QrcodeScan()),
              listTile_("비품관리", productManage()),
              listTile_("게시판", boardPage()),
              listTile_("Google Drive", GoogleDrive()),
              listTile_("Git", GitHub()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavi_(),
    );
  }
  Widget bottomNavi_() {
    return Container(
      height: height(70),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff3677DC),
        unselectedItemColor: Color(0xffDBDBDB),
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
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
  Widget listTile_(String title, Widget nextWidget) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: height(14))),
      onTap: () {Navigator.push(context,
          MaterialPageRoute(builder: (context) => nextWidget));},
      contentPadding: EdgeInsets.only(left: width(25)),
      visualDensity: VisualDensity(vertical: -3),
    );
  }
}
