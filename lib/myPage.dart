import 'package:flutter/material.dart';
import 'scrab.dart';
import 'rent.dart';
import 'myhistory.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class myPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height : SizeConfig.blockSizeVertical * 100,
      width : SizeConfig.blockSizeHorizontal * 100,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SvgPicture.asset('images/coin_source/icon_profile_developer_80px.svg',
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('홍성호',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('컴퓨터모바일용합과', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18,right: 18),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => scrabPage()));
                    },
                    child: myPageList(Icons.bookmark, '스크랩한 게시글'),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => myhistoryPage()));
                    },
                    child: myPageList(Icons.settings, '나의 활동'),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => rentPage()));
                    },
                    child: myPageList(Icons.text_snippet_outlined, '대여 이력'),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => scrabPage()));
                    },
                    child: myPageList(Icons.settings, '설정'),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myPageList(IconData icon, String label) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: 64,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}