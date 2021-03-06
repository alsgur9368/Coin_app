import 'package:coin_main/First_screen/calendar.dart';
import 'package:coin_main/First_screen/qrcode.dart';
import 'package:coin_main/Main/alarm.dart';
import 'package:coin_main/Second_screen/github.dart';
import 'package:coin_main/Second_screen/google_drive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../notice.dart';
import '../productManagement.dart';
import 'scrab.dart';
import 'rent.dart';
import 'myhistory.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  static final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: height(70),
          elevation: 0,
          backgroundColor: Color(0xfffcfcfc),
          leading: IconButton(
              icon:
                  SvgPicture.asset('images/coin_source/icon_sidebar_28px.svg'),
              padding: EdgeInsets.only(left: width(10)),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          title: Center(
            child: Image.asset('images/coin_source/logo_appbar.png'),
          ),
          actions: <Widget>[
            IconButton(
                padding: EdgeInsets.only(right: width(10)),
                icon: SvgPicture.asset(
                    'images/coin_source/icon_appbar_notification_28px.svg',
                    width: width(28)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => alarm()));
                })
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
        body: Column(
          children: [
            inform_(context),
            Padding(
              padding: EdgeInsets.only(left: width(18), right: width(18)),
              child: Column(
                children: [
                  Divider(
                    height: 0.8,
                    color: Color(0xffDBDBDB),
                  ),
                  myPageList_(context, Icons.bookmark, '스크랩한 게시글', scrabPage()),
                  myPageList_(
                      context, Icons.settings, '나의 활동', myhistoryPage()),
                  myPageList_(context, Icons.text_snippet_outlined, '대여 이력',
                      rentPage()),
                  InkWell(
                    onTap: () {
                      storage.delete(key: "login");
                    },
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: height(64),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.black,
                                    size: width(20),
                                  ),
                                  SizedBox(width: width(10)),
                                  Text(
                                    "Logout",
                                    style: TextStyle(fontSize: width(16)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 0.8,
                          color: Color(0xffDBDBDB),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Container(
          width: width(252),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  margin: EdgeInsets.only(left: width(10), right: width(10)),
                  padding: EdgeInsets.fromLTRB(0, height(10), 0, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: Divider.createBorderSide(context,
                              color: Color(0xffDBDBDB)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: height(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: height(20), left: width(15)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: SvgPicture.asset(
                                        'images/coin_source/icon_profile_designer_50px.svg'),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            width(14), 0, 0, width(5)),
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
                              padding: EdgeInsets.only(
                                  bottom: height(20), left: width(15)),
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                listTile_("공지사항", Notice()),
                listTile_("캘린더", MyHomePage(title: '캘린더')),
                listTile_("출석", QrcodeScan()),
                listTile_("비품관리", productManage()),
                listTile_("Google Drive", GoogleDrive()),
                listTile_("Git", GitHub()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inform_(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(width(20), height(20), width(20), height(20)),
      child: Row(
        children: [
          SvgPicture.asset(
            'images/coin_source/icon_profile_developer_80px.svg',
            height: height(80),
            width: width(80),
          ),
          SizedBox(width: width(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('홍성호',
                    style: TextStyle(
                        fontSize: width(18), fontWeight: FontWeight.bold)),
                Text('컴퓨터모바일용합과', style: TextStyle(fontSize: width(12))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myPageList_(
      BuildContext context, IconData icon, String label, Widget nextpage) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextpage));
      },
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: height(64),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.black,
                      size: width(20),
                    ),
                    SizedBox(width: width(10)),
                    Text(
                      label,
                      style: TextStyle(fontSize: width(16)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 0.8,
            color: Color(0xffDBDBDB),
          )
        ],
      ),
    );
  }

  Widget listTile_(String title, Widget nextWidget) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: height(14))),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextWidget));
      },
      contentPadding: EdgeInsets.only(left: width(25)),
      visualDensity: VisualDensity(vertical: -3),
    );
  }
}
