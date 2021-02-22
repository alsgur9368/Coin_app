import 'package:flutter/material.dart';
import 'scrab.dart';
import 'rent.dart';
import 'myhistory.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:coin_main/First_screen/homePage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
                  myPageList_(context, Icons.settings, '나의 활동', myhistoryPage()),
                  myPageList_(context, Icons.text_snippet_outlined, '대여 이력', rentPage()),
                  myPageList_(context, Icons.settings, '설정', scrabPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inform_(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width(20), height(20), width(20), height(20)),
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
                    style:
                        TextStyle(fontSize: width(18), fontWeight: FontWeight.bold)),
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
}
