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
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                height: height(60),
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
                      ),
                      Container(
                        child: Text('공지사항',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        padding: EdgeInsets.fromLTRB(width(4), 0, width(10), 0),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        indent: 14,
                        endIndent: 14,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(width(10), 0, 0, 0),
                        child: Text('2월 개발계획 공지합니다.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: height(30)),
              child: Container(
                child: Image(
                    image: AssetImage('images/coin_source/calendar_box.png'),
                    fit: BoxFit.fill,
                    width: width(335)),
              ),
            ),
            Container(
              height: height(210),
              width: width(335),
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
                      padding: EdgeInsets.fromLTRB(width(10), height(8), 0, height(8)),
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
                      margin: EdgeInsets.only(bottom: height(10)),
                      padding: EdgeInsets.fromLTRB(width(10), height(10), width(10), height(10)),
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
                                Text("평일반복"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: height(10)),
                      padding: EdgeInsets.fromLTRB(width(10), height(10), width(10), height(10)),
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
                      padding: EdgeInsets.fromLTRB(width(10), height(10), width(10), height(10)),
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
                    height: height(120),
                    width: width(161),
                    padding: EdgeInsets.fromLTRB(width(20), height(20), 0, 0),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: height(17)),
                            child: SvgPicture.asset(
                                'images/coin_source/icon_attendance_qrcode_40px.svg',
                                width: width(40),
                                height: height(40)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: height(6)),
                            child: Text(
                              '출석체크',
                              style: TextStyle(fontSize: width(14)),
                            ),
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
                    width: width(161),
                    height: height(260),
                    margin: EdgeInsets.fromLTRB(width(13), height(20), width(10), height(32)),
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
                          child: Text("Online"),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: height(12)),
                          child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                    width: width(1), color: Colors.grey[300]),
                                verticalInside: BorderSide(
                                    width: width(1), color: Colors.grey[300]),
                                top: BorderSide(
                                    width: width(1), color: Colors.grey[300]),
                                bottom: BorderSide(
                                    width: width(1), color: Colors.grey[300]),
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('김석환'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('윤민혁'),
                                          SizedBox(width: width(4)),
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
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('임진우'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('김정현'),
                                          SizedBox(width: width(4)),
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
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('한지수'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('홍성호'),
                                          SizedBox(width: width(4)),
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
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('박정혁'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('김의연'),
                                          SizedBox(width: width(4)),
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
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('금도현'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_offline_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('권지수'),
                                          SizedBox(width: width(4)),
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
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width(2.5)),
                                          Text('최이슬'),
                                          SizedBox(width: width(4)),
                                          SvgPicture.asset(
                                              'images/coin_source/icon_online_16px.svg'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, height(5), 0, height(5)),
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
