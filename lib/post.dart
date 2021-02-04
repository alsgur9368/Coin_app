import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자유게시판'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25, 20, 0, 13),
            child: Text(
              '어제 내 세상이 무너졌어',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                  ),
                  padding: EdgeInsets.only(left: 25, right: 6),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('임진우'),
                      padding: EdgeInsets.only(bottom: 2),
                    ),
                    Text(
                      '2021년 1월 21일 (목) 02:37',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
          Container(
            child: Text(
                '고백받았는데 내가 거절했어 \n한순간에 남같이 돌변하더라\n너무힘들어 지금도 울고있어\n보고싶다 매일밤 전화하던게\n너무너무그리워 내 목숨을 가져가도 좋아\n제발 연락해줘 김석환'),
            padding: EdgeInsets.only(left: 25, top: 20, bottom: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: FlatButton(onPressed: () {}, child: Text('스크랩  2'),shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.grey[200])
                ),),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('목록보기'),
                    Container(
                      child: Icon(
                        Icons.list_rounded,
                        color: Colors.grey[300],
                      ),
                      padding: EdgeInsets.only(right: 2),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey[200]),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            color: Colors.grey[200],
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('총 2개 댓글'),
                padding: EdgeInsets.only(left: 25, top: 12),
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                    ),
                    padding: EdgeInsets.only(left: 25,top: 10,right: 6),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(child: Text('고명진'),padding: EdgeInsets.only(right: 4),),
                          Text(
                            '3시간 전',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        child: Text('아 새벽이구나 ㅇㅈ 김석환'),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                    ),
                    padding: EdgeInsets.only(left: 25,top: 10,right: 6),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text('김석환'),
                            padding: EdgeInsets.only(right: 4),
                          ),
                          Text(
                            '1시간 전',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        child: Text('그냥 과씨씨 두번하고 목숨 챙겨라'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}