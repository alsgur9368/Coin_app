import 'package:flutter/material.dart';
import 'scrab.dart';
import 'rent.dart';
import 'myhistory.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

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
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
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
            inform_(context),

            Padding(
              padding: EdgeInsets.only(left: width(18), right: width(18)),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.grey,
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
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('컴퓨터모바일용합과', style: TextStyle(fontSize: 12)),
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
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
