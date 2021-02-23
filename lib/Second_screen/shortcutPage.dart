import 'package:coin_main/First_screen/calendar.dart';
import 'package:coin_main/First_screen/homePage.dart';
import 'package:coin_main/First_screen/qrcode.dart';
import 'package:coin_main/Four_screen/myPage.dart';
import 'package:coin_main/Main/alarm.dart';
import 'package:coin_main/Third_screen/boardPage.dart';
import 'package:coin_main/notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'github.dart';
import 'google_drive.dart';
import 'package:coin_main/productManagement.dart';

class shortcutPage extends StatefulWidget {
  final Widget bottomNavi;
  shortcutPage({this.bottomNavi});

  @override
  _shortcutPageState createState() => _shortcutPageState();
}

class _shortcutPageState extends State<shortcutPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    Widget shortCut_(String title, String shortCutImage, Widget shortCutWidget) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => shortCutWidget));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(width(20), height(5), width(20), height(5)),
              child: Row(
                children: [
                  SvgPicture.asset(shortCutImage, height: height(44)),
                  SizedBox(
                      width: width(14)),
                  Text(title)
                ],
              ),
            ),
          ),
          Divider(
              color: Color(0xffDBDBDB), thickness: 0.8, indent: width(20), endIndent: width(20)),
        ],
      );
    }

    return Scaffold(
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => alarm()));
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
          SizedBox(height: 8),
          shortCut_('공지사항', 'images/coin_source/icon_notice_44px.svg', Notice()),
          shortCut_('비품관리', 'images/coin_source/icon_equipment_44px.svg', productManage()),
          shortCut_('Google Drive', 'images/coin_source/icon_googledrive_44px.svg', GoogleDrive()),
          shortCut_('Github', 'images/coin_source/icon_github_44px.svg',  GitHub()),
        ],
      ),
      drawer: Container(
        width: width(252),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: height(180),
                child: DrawerHeader(
                  margin: EdgeInsets.only(left: width(10), right: width(10)),
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
                              padding: EdgeInsets.only(left: width(15)),
                              child: Icon(Icons.chevron_right, size: height(24)),
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
