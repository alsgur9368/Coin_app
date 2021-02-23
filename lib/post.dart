import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_main/Main/main.dart';

const String _name = "이름";

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }
  
  int _scrap = 2;
  var _color;
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _scrap -= 1;
        _color = Colors.white;
        _isFavorited = false;
      } else {
        _scrap += 1;
        _color = Color(0xFFFFEDD2);
        _isFavorited = true;
      }
    });
  }

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black,size: width(28),),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('자유게시판', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: width(20),right: width(20)),
            color: Color(0xFFDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: ListView(
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                postTitle_(),
                postProfile_(),
                Divider(
                  thickness: 0.8,
                  endIndent: width(20),
                  indent: width(20),
                  color: Color(0xFFDBDBDB),
                ),
                postContent_(),
                postButtons_(),
                Padding(
                  padding: EdgeInsets.only(top: height(40)),
                  child: Container(
                    color: Color(0xFFDBDBDB),
                    height: height(24),
                  ),
                ),

              ],
            ),
          postComment_(),
          _buildTextComposer(),
          ],
      ),
    );
  }

  Widget postTitle_() {
    return Container(
      padding: EdgeInsets.fromLTRB(width(25), height(20), 0, height(13)),
      child: Text(
        '어제 내 세상이 무너졌어',
        style: TextStyle(fontSize: width(20)),
      ),
    );
  }
  Widget postProfile_(){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            padding: EdgeInsets.only(left: width(25), right: width(6)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('임진우'),
                padding: EdgeInsets.only(bottom: height(2)),
              ),
              Text(
                '2021년 1월 21일 (목) 02:37',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget postContent_(){
    return Container(
      child: Text(
          '고백받았는데 내가 거절했어 \n한순간에 남같이 돌변하더라\n너무힘들어 지금도 울고있어\n보고싶다 매일밤 전화하던게\n너무너무그리워 내 목숨을 가져가도 좋아\n제발 연락해줘 김석환'),
      padding: EdgeInsets.only(left: width(25), top: height(20), bottom: height(40)),
    );
  }
  Widget postButtons_ (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: width(10)),
          child: FlatButton(
            onPressed: _toggleFavorite,
            child: Text('스크랩 $_scrap'),
            color: _color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.grey[200])),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('목록보기'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey[200])),
        )
      ],
    );
  }
  Widget postComment_(){
    int comments = _messages.length;
    return Flex(direction: Axis.vertical, children: [
      Align(child: Container(child: Text('총 $comments개 댓글'),padding: EdgeInsets.only(left: width(25),top: height(12),bottom: height(13)),),alignment: Alignment.centerLeft,),
      Divider(
        thickness: 0.8,
        endIndent: width(20),
        indent: width(20),
        color: Color(0xFFDBDBDB),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, int index) => _messages[index],
        reverse: true,
        padding: EdgeInsets.all(8.0),
        itemCount: _messages.length,
      ),
    ]);
  }
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        color: Color(0xFFDBDBDB),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: width(335),
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: '댓글을 입력해주세요.',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    var message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
