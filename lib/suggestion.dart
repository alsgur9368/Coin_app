import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('건의하기'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){}),
        ],
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