import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class createPost extends StatefulWidget {
  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<createPost> {
  String _chosenValue;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("글 작성하기"),
        actions: <Widget>[
          RaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Text("완료", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "제목",
              ),
            ),
          ),
          Container(
            height: 60,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _chosenValue,
              items: <String>[
                "과제",
                "학습노트",
                "학습계획표",
                "공모전",
                "Q&A",
                "건의하기",
                "자유게시판",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text("카테고리"),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "글을 작성해주세요",
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                      "images/coin_source/icon_camera_30px.svg"),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      SvgPicture.asset("images/coin_source/icon_filw_30px.svg"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
