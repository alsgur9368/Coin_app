import 'package:flutter/material.dart';

class createPost extends StatefulWidget {
  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<createPost> {
  final List<String> _items = [
    '카테고리',
    '과제',
    '학습노트',
    '학습계획표',
    '공모전',
    'Q&A',
    '건의하기',
    '자유게시판'
  ];
  TextEditingController _listChangeController = TextEditingController();
  String _value;
  @override
  void initState() {
    super.initState();
    _value = _items.first;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("글 작성하기"),
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
            child: Row(
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: Container(
                    child: DropdownButton<String>(
                      value: _value,
                      items: _items.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: _onDropDownChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[300]),
          Container(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "글을 작성해주세요",
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onDropDownChanged(String value){
    setState(() {
      _value = value;
    });
  }
}
