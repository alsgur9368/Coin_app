import 'package:coin_main/contest.dart';
import 'package:coin_main/homework.dart';
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

    return Scaffold(
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
    );
  }
}
