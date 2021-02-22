import 'package:flutter/material.dart';
import 'createPost.dart';

class StudyNote extends StatefulWidget {
  @override
  _StudyNoteState createState() => _StudyNoteState();
}

class _StudyNoteState extends State<StudyNote> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

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
        title: Text('학습노트', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(right: width(10)),
              icon: Icon(Icons.add_sharp, color: Colors.black,size: width(28)),
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
