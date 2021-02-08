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
        title: Text(
          '공지사항',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
