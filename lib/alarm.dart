import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class alarm extends StatelessWidget {
  List<Notice> notices = [
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_notice_44px.svg"),
      title: "새로운 공지가 등록되었습니다.",
      time: "1분 전",
    ),
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_calender_44px.svg"),
      title: "일정이 있습니다.",
      time: "2시간 전",
    ),
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_comment_44px.svg"),
      title: "게시글에 새로운 댓글이 있습니다.",
      time: "1일 전",
    ),
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_mention_44px.svg"),
      title: "금도현님이 회원님을 언급했습니다.",
      time: "2일 전",
    ),
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_mention_44px.svg"),
      title: "금도현님이 회원님을 언급했습니다.",
      time: "2일 전",
    ),
    Notice(
      icon: SvgPicture.asset("images/coin_source/icon_equipment_44px.svg"),
      title: "반납 알림이 있습니다.",
      time: "3일 전",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("알림"),
        ),
        body: ListView.separated(
          itemCount: notices.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: notices[index].icon,
                      title: Text(notices[index].title),
                      trailing: Text(notices[index].time),
                      onTap: () {},
                    ),
                  ]),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: Colors.grey[300], thickness: 1, indent: 20, endIndent: 20),
        ));
  }
}

class Notice {
  final String title;
  final SvgPicture icon;
  final String time;

  Notice({this.icon, this.title, this.time});
}
