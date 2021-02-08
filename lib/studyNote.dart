import 'package:flutter/material.dart';

class StudyNote extends StatefulWidget {
  @override
  _StudyNoteState createState() => _StudyNoteState();
}

class _StudyNoteState extends State<StudyNote> {
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
                  title: Text(suggestionList[index].title),
                  subtitle: Text(suggestionList[index].time),
                  onTap: (){},
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

List<StudyNotePost> suggestionList = <StudyNotePost>[
  StudyNotePost(
    title: '학습노트1',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트2',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트3',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트4',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트5',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트6',
    time: '1시간 전',
  ),
  StudyNotePost(
    title: '학습노트7',
    time: '1시간 전',
  ),
];

class StudyNotePost {
  final String title;
  final String time;

  StudyNotePost({this.title,this.time});
}
