import 'package:flutter/material.dart';
import 'createPost.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
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
        title: Text('건의하기', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
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
      body: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  title: Text(suggestionList[index].stitle),
                  subtitle: Text(suggestionList[index].stime),
                  onTap: (){
                    showDialog(context: context,builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('비밀번호를 입력해주세요.'),
                        content: TextField(
                          obscureText: true,
                        ),
                      );
                    });
                  },
                ),
                Divider(
                  thickness: 1.0,
                  endIndent: 25,
                  indent: 25,
                ),
              ],
            );
          }),
    );
  }
}

List<SuggestionPost> suggestionList = <SuggestionPost>[
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
];

class SuggestionPost {
  final String stitle;
  final String stime;

  SuggestionPost({this.stitle,this.stime});
}