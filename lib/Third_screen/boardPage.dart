import 'package:coin_main/First_screen/calendar.dart';
import 'package:coin_main/First_screen/homePage.dart';
import 'package:coin_main/First_screen/qrcode.dart';
import 'package:coin_main/Four_screen/myPage.dart';
import 'package:coin_main/Second_screen/github.dart';
import 'package:coin_main/Second_screen/google_drive.dart';
import 'package:coin_main/contest.dart';
import 'package:coin_main/homework.dart';
import 'package:coin_main/notice.dart';
import 'package:coin_main/productManagement.dart';
import 'package:coin_main/qna.dart';
import 'package:coin_main/studyNote.dart';
import 'package:coin_main/studyPlan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coin_main/freeBoard.dart';
import '../suggestion.dart';

class boardPage extends StatefulWidget {
  @override
  _boardPageState createState() => _boardPageState();
}

class _boardPageState extends State<boardPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  @override
  Widget build(BuildContext context) {
    Widget boardList_(String title, Widget boardWidget) {
      return Column(
        children: [
          Divider(
            height: 0.8,
            indent: width(20),
            endIndent: width(20),
            color: Color(0xffDBDBDB),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: width(20), right: width(20)),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => boardWidget)),
          ),
        ],
      );
    }

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
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.fromLTRB(width(20), 0, width(20), 0),
            color: Color(0xffDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.only(left: width(20), right: width(20)),
              leading: SvgPicture.asset(
                  'images/coin_source/icon_board_folder_18px.svg',
                  width: width(18)),
              title: Text(
                "STUDY",
                style: TextStyle(
                  fontSize: width(16),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff191919),
                ),
              ),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                boardList_("과제", Homework()),
                boardList_("학습노트", StudyNote()),
                boardList_("학습계획표", StudyPlan()),
              ],
            ),
          ),
          boardList_("공모전", Contest()),
          boardList_("Q&A", QnA()),
          boardList_("건의하기", Suggestion()),
          boardList_("자유게시판", Free()),
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
