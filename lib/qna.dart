import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'createPost.dart';
import 'post.dart';

class QnA extends StatefulWidget {
  @override
  _QnAState createState() => _QnAState();
}

List<BoardList> _list = <BoardList>[
  BoardList(
    titles: '어제 내 세상이 무너졌어',
    names: '임진우 - 1시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
  BoardList(
    titles: 'ㅈㄷㄱㅅ',
    names: '권지수 - 3시간전',
  ),
];

class _QnAState extends State<QnA> {
  String filter;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
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
        title: Text('Q&A', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_sharp, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => createPost()));
              }),
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: 2,
          ),
          preferredSize: Size.fromHeight(2),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                hintText: '검색어를 입력하세요.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return filter == null || filter == ""
                      ? Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('${_list[index].titles}'),
                        subtitle: Text('${_list[index].names}'),
                        onTap: () => _onTapItem(context, _list[index]),
                        trailing: FittedBox(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "images/coin_source/icon_list_bookmark_12px.svg"),
                                    SizedBox(width: 4),
                                    Text('0'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "images/coin_source/icon_list_comment_12px.svg"),
                                    SizedBox(width: 4),
                                    Text('3'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  )
                      : '${_list[index].titles}'
                      .toLowerCase()
                      .contains(filter.toLowerCase())
                      ? Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('${_list[index].titles}'),
                        subtitle: Text('${_list[index].names}'),
                        onTap: () =>
                            _onTapItem(context, _list[index]),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  )
                      : Container();
                }),
          ),
        ],
      ),
    );
  }

  void _onTapItem(BuildContext context, BoardList boardList) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Post()));
  }
}

class BoardList {
  final String titles;
  final String names;

  BoardList({this.titles, this.names});
}
