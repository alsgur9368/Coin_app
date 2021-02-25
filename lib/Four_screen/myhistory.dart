import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myhistoryPage extends StatefulWidget {
  @override
  _myhistoryPageState createState() => _myhistoryPageState();
}

List<MyWriteComments> comments = [
  MyWriteComments(
    title: '목숨 호록(사진)',
    subtitle: '어제 내 세상이 무너졌어',
  ),
  MyWriteComments(
    title: '목숨 호록(사진)',
    subtitle: '어제 내 세상이 무너졌어',
  ),
  MyWriteComments(
    title: '목숨 호록(사진)',
    subtitle: '어제 내 세상이 무너졌어',
  ),
];

List<MyWritePosts> posts = [
  MyWritePosts(
    title: 'asdf',
    name: '권지수 ㆍ ',
    time: '1시간 전',
  ),
];

class _myhistoryPageState extends State<myhistoryPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
          title: Text('나의 활동', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.only(left: width(20),right: width(20)),
              color: Color(0xFFDBDBDB),
              height: height(1),
            ),
            preferredSize: Size.fromHeight(height(1)),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                myhistoryTtggle_(),
                myWrites_()
              ],
            ),
          ),
        ),
      );

  }

  Widget myhistoryTtggle_() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,height(20),0,height(20)),
      child: ToggleButtons(
        borderColor: Colors.blueAccent,
        fillColor: Colors.blueAccent,
        borderWidth: 2,
        selectedBorderColor: Colors.blueAccent,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width(22),0,width(22),0),
            child: Text(
              '  내가 쓴 글  ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:
                      isSelected[0] == true ? Colors.white : Colors.blue[100]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width(22),0,width(22),0),
            child: Text(
              '내가 쓴 댓글',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:
                      isSelected[0] == false ? Colors.white : Colors.blue[100]),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              if (i == index) {
                isSelected[i] = true;
              } else {
                isSelected[i] = false;
              }
            }
          });
        },
        isSelected: isSelected,
      ),
    );
  }

  Widget myWrites_(){
    return Container(
      child: isSelected[0] == true
          ? Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(width(10),height(20),width(10),height(20)),
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(posts[index].title),
                      subtitle: Row(
                        children: [
                          Text(posts[index].name),
                          Text(posts[index].time),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffDBDBDB), thickness: 0.8, indent: width(10), endIndent: width(10),
                    )
                  ],
                );
              }),
        ),
      )
          : Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(width(10),height(20),width(10),height(20)),
          child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(comments[index].title),
                      subtitle:
                      Text(comments[index].subtitle),
                    ),
                    Divider(
                        color: Color(0xffDBDBDB), thickness: 0.8, indent: width(10), endIndent: width(10),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

}

class MyWritePosts {
  final String title;
  final String name;
  final String time;

  MyWritePosts({this.title, this.name, this.time});
}

class MyWriteComments {
  final String title;
  final String subtitle;

  MyWriteComments({this.title, this.subtitle});
}
