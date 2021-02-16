import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  final List<String> titles = ['2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지','2월 개발계획 공지'];
  final List<String> dates = ['2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10','2021/01/13 수 16:10'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('자유게시판', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: 2,
          ),
          preferredSize: Size.fromHeight(2),
        ),
      ),
      body: ListView.separated(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(titles[index]),
            subtitle: Text(dates[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
