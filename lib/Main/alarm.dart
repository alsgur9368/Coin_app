import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class alarm extends StatefulWidget {
  @override
  _alarmState createState() => _alarmState();
}

class _alarmState extends State<alarm> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  List<NoticeList> notices = [
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_notice_44px.svg"),
      title: "새로운 공지가 등록되었습니다.",
      time: "1분 전",
    ),
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_calender_44px.svg"),
      title: "일정이 있습니다.",
      time: "2시간 전",
    ),
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_comment_44px.svg"),
      title: "게시글에 새로운 댓글이 있습니다.",
      time: "1일 전",
    ),
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_mention_44px.svg"),
      title: "금도현님이 회원님을 언급했습니다.",
      time: "2일 전",
    ),
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_mention_44px.svg"),
      title: "금도현님이 회원님을 언급했습니다.",
      time: "2일 전",
    ),
    NoticeList(
      icon: SvgPicture.asset("images/coin_source/icon_equipment_44px.svg"),
      title: "반납 알림이 있습니다.",
      time: "3일 전",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height(70),
          elevation: 0,
          backgroundColor: Color(0xfffcfcfc),
          leading: IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.black, size: width(28)),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text('알림', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff191919), fontSize: width(16))),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.fromLTRB(width(20), 0, width(20), 0),
              color: Color(0xffDBDBDB),
              height: height(1),
            ),
            preferredSize: Size.fromHeight(1),
          ),
        ),
        body: ListView.separated(
          itemCount: notices.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.only(left: width(20), right: width(20)),
                      leading: notices[index].icon,
                      title: Text(notices[index].title, style: TextStyle(fontSize: width(14), color: Color(0xff191919))),
                      trailing: Text(notices[index].time, style: TextStyle(fontSize: width(12), color: Color(0xff767676))),
                      onTap: () {},
                    ),
                  ]),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(indent: width(20), endIndent: width(20), color: Color(0xffDBDBDB), thickness: 0.8),
        ));
  }
}

class NoticeList {
  final String title;
  final SvgPicture icon;
  final String time;

  NoticeList({this.icon, this.title, this.time});
}
