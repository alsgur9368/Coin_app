import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  final List<String> titles = ['2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지'];
  final List<String> dates = ['2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10'];
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
        title: Text('공지사항', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff191919), fontSize: width(16))),
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.fromLTRB(width(20), 0, width(20), 0),
            color: Color(0xffDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(1),
        ),
      ),
      body: noticeList_(),
    );
  }

  Widget noticeList_(){
    return ListView.separated(
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.only(left: width(25)),
          title: Text(titles[index]),
          subtitle: Text(dates[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(indent: width(20),endIndent: width(20), color: Color(0xffDBDBDB), thickness: 0.8),
    );
  }

}
