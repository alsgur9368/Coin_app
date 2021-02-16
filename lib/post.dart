import 'package:flutter/material.dart';

const String _name = "이름";

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int _scrap = 3;
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _scrap -= 1;
        _isFavorited = false;
      } else {
        _scrap += 1;
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
        title: Text('자유게시판'),
      ),
      body: ListView(
        children: [
          Column(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: _toggleFavorite,
                    child: Text('스크랩 $_scrap'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey[200])),
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
              ),
            ],
          ),
          Flex(direction: Axis.vertical, children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (_, int index) => _messages[index],
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
            ),
          ]),
        ],
      ),
      persistentFooterButtons: [
        Row(
          children: [
            SizedBox(
                width: 250,
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: '댓글을 입력해주세요.',
                  ),
                )),
            IconButton(
              icon: Icon(Icons.send,color: Colors.blue ,),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: '댓글을 입력해주세요.',
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
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
              )
            ],
          )
        ],
      ),
    );
  }
}
