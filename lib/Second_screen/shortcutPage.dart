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
    );
  }

}
