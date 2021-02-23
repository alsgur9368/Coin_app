import 'package:coin_main/Four_screen/myPage.dart';
import 'package:coin_main/Second_screen/github.dart';
import 'package:coin_main/Second_screen/google_drive.dart';
import 'package:coin_main/Third_screen/boardPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../productManagement.dart';
import 'qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'calendar.dart';
import 'package:coin_main/notice.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
      body: Center(
        child: Column(
          children: <Widget>[
            notice_(),
            calendar_box_(),
            calendar_(),
            Container(
              padding: EdgeInsets.only(bottom: height(40)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  qrcode_(),
                  online_(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notice_() {
    return Container(
        height: height(60),
        decoration: BoxDecoration(color: Color(0xff5cb3e8)),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Notice()));
          },
          child: Row(
            children: [
              Container(
                child: Icon(
                  Icons.campaign,
                  color: Colors.white,
                  size: width(16),
                ),
                padding: EdgeInsets.only(left: width(5)),
              ),
              Container(
                child: Text('공지사항',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width(14))),
                padding: EdgeInsets.fromLTRB(width(4), 0, width(20), 0),
              ),
              VerticalDivider(
                thickness: 0.8,
                indent: height(14),
                endIndent: height(14),
                color: Color(0xffEDEDED),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(width(20), 0, 0, 0),
                  child: Text(
                      '2월 개발계획 공지합니다. 2월 1일 어쩌구~하시고 2월 16일부터 어쩌구~하시고 아 2월 17일 수강신청인데 나 이번에 교양 못들으면 어떡하지 졸업해야 하는데 암튼 공지임',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontSize: width(14))),
                ),
              ),
            ],
          ),
        ));
  }

  Widget calendar_box_() {
    return Container(
        padding: EdgeInsets.fromLTRB(width(20), height(30), width(20), 0),
        child: Image(
            image: AssetImage('images/coin_source/calendar_box.png'),
            fit: BoxFit.fill,
            width: width(335)));
  }

  Widget calendar_() {
    return Container(
      width: width(335),
      height: height(200),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: '켈린더',
                  )));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(width(6), height(8), 0, height(8)),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    child: Text("11",
                        style: TextStyle(
                            fontSize: height(20), color: Color(0xff505050))),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: width(6)),
                    child: Text("월요일",
                        style: TextStyle(
                            fontSize: height(12), color: Color(0xff505050))),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height(10)),
                    padding: EdgeInsets.fromLTRB(
                        width(12), height(10), width(10), height(10)),
                    decoration: BoxDecoration(
                      color: Color(0xffEBF8FF),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("동계 동아리 활동 13:00",
                            style: TextStyle(
                                color: Color(0xff505050),
                                fontSize: height(14))),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'images/coin_source/icon_calender_loop.svg'),
                              SizedBox(width: width(5)),
                              Text("평일반복",
                                  style: TextStyle(
                                      fontSize: height(12),
                                      color: Color(0xff999999))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height(10)),
                    padding: EdgeInsets.fromLTRB(
                        width(12), height(10), width(10), height(10)),
                    decoration: BoxDecoration(
                      color: Color(0xffEBF8FF),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("COIN 동아리 어플 개발 회의 13:30",
                            style: TextStyle(
                                color: Color(0xff505050),
                                fontSize: height(14))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height(10)),
                    padding: EdgeInsets.fromLTRB(
                        width(12), height(10), width(10), height(10)),
                    decoration: BoxDecoration(
                      color: Color(0xffF7FFE2),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("동아리방 대청소 16:00",
                            style: TextStyle(
                                color: Color(0xff505050),
                                fontSize: height(14))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget qrcode_() {
    return Container(
      padding: EdgeInsets.fromLTRB(width(20), height(20), 0, 0),
      child: ButtonTheme(
        minWidth: width(161),
        height: height(100),
        child: RaisedButton(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: height(17)),
                child: SvgPicture.asset(
                    'images/coin_source/icon_attendance_qrcode_40px.svg'),
              ),
              Container(
                padding: EdgeInsets.only(top: height(6), bottom: height(17)),
                child: Text(
                  '출석체크',
                  style: TextStyle(fontSize: height(14)),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QrcodeScan()));
          },
        ),
      ),
    );
  }

  Widget online_() {
    return Flexible(
      child: Container(
        width: width(161),
        margin: EdgeInsets.fromLTRB(width(13), height(20), 0, 0),
        padding: EdgeInsets.fromLTRB(width(15), height(11), width(15), 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
          ],
        ),
        child: Column(
          children: [
            Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Online", style: TextStyle(fontSize: height(16))),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: height(12), bottom: height(30)),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    horizontalInside:
                    BorderSide(width: 1, color: Color(0xffDBDBDB)),
                    verticalInside:
                    BorderSide(width: 1, color: Color(0xffDBDBDB)),
                    top: BorderSide(width: 1, color: Color(0xffDBDBDB)),
                    bottom: BorderSide(width: 1, color: Color(0xffDBDBDB)),
                  ),
                  children: [
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('김석환',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_offline_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('윤민혁',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('임진우',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('김정현',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_offline_16px.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('한지수',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_offline_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('홍성호',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('박정혁',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('김의연',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_offline_16px.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('금도현',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_offline_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('권지수',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                          child: Row(
                            children: [
                              SizedBox(width: width(5)),
                              Text('최이슬',
                                  style: TextStyle(fontSize: height(12))),
                              SizedBox(width: width(8)),
                              SvgPicture.asset(
                                  'images/coin_source/icon_online_16px.svg'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.fromLTRB(0, height(6), 0, height(6)),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
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
