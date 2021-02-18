import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.fromLTRB(width(4), 0, width(20), 0),
                ),
                VerticalDivider(
                  thickness: 1,
                  indent: height(14),
                  endIndent: height(14),
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(width(20), 0, 0, 0),
                  child: Text('2월 개발계획 공지합니다.',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
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
        height: height(196),
        width: width(335),
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(
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
                padding: EdgeInsets.fromLTRB(
                    width(10), height(8), 0, height(8)),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text("11"),
                    Text("월요일"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height(10)),
                padding: EdgeInsets.fromLTRB(
                    width(10), height(10), width(10), height(10)),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("동계 동아리 활동 13:00"),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'images/coin_source/icon_calender_loop.svg'),
                          SizedBox(width: width(5)),
                          Text("평일반복", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height(10)),
                padding: EdgeInsets.fromLTRB(
                    width(10), height(10), width(10), height(10)),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("COIN 동아리 어플 개발 회의 13:30"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height(10)),
                padding: EdgeInsets.fromLTRB(
                    width(10), height(10), width(10), height(10)),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("동아리방 대청소 16:00"),
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
                  child: Text('출석체크'),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrcodeScan()));
            },
          ),
        ),
      );
    }
    Widget online_() {
      return Container(
        width: width(161),
        height: height(260),
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
              child: Text("Online", style: TextStyle(fontSize: 16)),
            ),
            Container(
              padding: EdgeInsets.only(top: height(18)),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    horizontalInside:
                    BorderSide(width: 1, color: Colors.grey[300]),
                    verticalInside: BorderSide(
                        width: 1, color: Colors.grey[300]),
                    top: BorderSide(width: 1, color: Colors.grey[300]),
                    bottom: BorderSide(width: 1, color: Colors.grey[300]),
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
                              Text('김석환', style: TextStyle(fontSize: 12)),
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
                              Text('윤민혁', style: TextStyle(fontSize: 12)),
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
                              Text('임진우', style: TextStyle(fontSize: 12)),
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
                              Text('김정현', style: TextStyle(fontSize: 12)),
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
                              Text('한지수', style: TextStyle(fontSize: 12)),
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
                              Text('홍성호', style: TextStyle(fontSize: 12)),
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
                              Text('박정혁', style: TextStyle(fontSize: 12)),
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
                              Text('김의연', style: TextStyle(fontSize: 12)),
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
                              Text('금도현', style: TextStyle(fontSize: 12)),
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
                              Text('권지수', style: TextStyle(fontSize: 12)),
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
                              Text('최이슬', style: TextStyle(fontSize: 12)),
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
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            notice_(),
            calendar_box_(),
            calendar_(),
            Container(
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
}
