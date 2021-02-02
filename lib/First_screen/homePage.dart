import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'qrcode.dart';
import 'package:flutter/cupertino.dart';

class homePage extends StatelessWidget {

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
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.campaign, color: Colors.white),
                      padding: EdgeInsets.only(left: 0),
                    ),
                    Container(
                      child: Text('공지사항', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.fromLTRB(4,0,10,0),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      indent: 14,
                      endIndent: 14,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('2월 개발계획 공지합니다.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ),
            Container(
              height: 210,
              width: 355,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('images/coin_source/calendar_box.png'),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text("11"),
                          Text("월요일"),
                        ],
                      ),
                    ),
                    Container(

                    ),
                    Container(),
                    Container(),
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
                            padding: EdgeInsets.only(top:17),
                            child: SvgPicture.asset('images/coin_source/icon_attendance_qrcode_40px.svg'),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:6),
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
                    width: 191,
                    height: 260,
                    padding: EdgeInsets.fromLTRB(13, 20, 10, 32),
                    child: RaisedButton(
                      child: Text('현활'),
                      color: Colors.white,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
