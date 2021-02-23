import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'calendar.dart';
import 'package:coin_main/notice.dart';
import 'dart:ui';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                height: 60,
                decoration: BoxDecoration(color: Color(0xff5cb3e8)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Notice()));
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.campaign, color: Colors.white),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      Container(
                        child: Text('공지사항',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        indent: 14,
                        endIndent: 14,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('2월 개발계획 공지합니다.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  child: Image(image: AssetImage('images/coin_source/calendar_box.png'), fit: BoxFit.fill,
                  )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height* (210/MediaQuery.of(context).size.height),
              width: MediaQuery.of(context).size.width*(335/MediaQuery.of(context).size.width),
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text("11"),
                          Text("월요일"),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
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
                                SizedBox(width: 5),
                                Text("평일반복"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
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
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
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
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 191,
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 17),
                            child: SvgPicture.asset(
                                'images/coin_source/icon_attendance_qrcode_40px.svg'),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6),
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
                            MaterialPageRoute(
                                builder: (context) => QrcodeScan()));
                      },
                    ),
                  ),
                  Container(
                    width: 171,
                    height: 240,
                    margin: EdgeInsets.fromLTRB(13, 20, 10, 32),
                    padding: EdgeInsets.fromLTRB(15, 11, 15, 0),
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
                          child: Text("Online"),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                    width: 1, color: Colors.grey[300]),
                                verticalInside: BorderSide(
                                    width: 1, color: Colors.grey[300]),
                                top: BorderSide(
                                    width: 1, color: Colors.grey[300]),
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey[300]),
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('김석환'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('윤민혁'),
                                          SizedBox(width: 8),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('임진우'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('김정현'),
                                          SizedBox(width: 8),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('한지수'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('홍성호'),
                                          SizedBox(width: 8),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('박정혁'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('김의연'),
                                          SizedBox(width: 8),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('금도현'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('권지수'),
                                          SizedBox(width: 8),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text('최이슬'),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    ),
                                  ],
                                ),
                              ]),
                        )
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
}
