import 'package:flutter/material.dart';

class scrabPage extends StatelessWidget {

  final List<String> entries = <String>['임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전'];

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
          title: Text('스크랩한 게시글', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
          bottom: PreferredSize(
            child: Container(
              color: Colors.grey[300],
              height: 2,
            ),
            preferredSize: Size.fromHeight(2),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      '어제 내 세상이 무너졌어',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        '${entries[index]}',
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ],
                )
            );
          },
          separatorBuilder: (BuildContext context, int index)=> const Divider(),
        )
    );
  }
}