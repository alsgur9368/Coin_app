import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'createPost.dart';
import 'post.dart';

class Free extends StatefulWidget {
  @override
  _FreeState createState() => _FreeState();
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

class _FreeState extends State<Free> {
  String filter;
  TextEditingController searchController = TextEditingController();

  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

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
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black,size: width(28)),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('자유게시판', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(right: width(10)),
              icon: Icon(Icons.add_sharp, color: Colors.black,size: width(28),),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => createPost()));
              }),
        ],
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: width(20),right: width(20)),
            color: Color(0xFFDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: Column(
        children: <Widget>[
          searchBox_(),
          freeList_(),
        ],
      ),
    );
  }

  Widget searchBox_() {
    return Padding(
      padding: EdgeInsets.fromLTRB(width(20), height(20), width(20), height(20)),
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
          contentPadding: EdgeInsets.fromLTRB(width(20), height(15), width(20), height(15)),
        ),
      ),
    );
  }

  Widget freeList_() {
    return Expanded(
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
                  contentPadding: EdgeInsets.only(left: width(25)),
                  trailing: FittedBox(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "images/coin_source/icon_list_bookmark_12px.svg"),
                              SizedBox(width: width(4)),
                              Text('0'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width(6),right: width(25)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "images/coin_source/icon_list_comment_12px.svg"),
                              SizedBox(width: width(4)),
                              Text('3'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.8,
                  endIndent: width(20),
                  indent: width(20),
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
                  thickness: 0.8,
                )
              ],
            )
                : Container();
          }),
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
