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
  List<bool> isSelected;
  bool toggle = false;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('asdasd'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: ToggleButtons(
                    borderColor: Colors.blueAccent,
                    fillColor: Colors.blueAccent,
                    borderWidth: 2,
                    selectedBorderColor: Colors.blueAccent,
                    selectedColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22,right: 22),
                        child: Text(
                          '  내가 쓴 글  ',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: toggle==false ? Colors.white : Colors.blue[100]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22,right: 22),
                        child: Text(
                          '내가 쓴 댓글',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: toggle == true ? Colors.white : Colors.blue[100]),
                        ),
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                        toggle = !toggle;
                      });
                    },
                    isSelected: isSelected,
                  ),
                ),
                Container(
                  child: toggle == false
                      ? Expanded(
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
                                    height: 0.5,
                                  )
                                ],
                              );
                            }),
                      )
                      : Expanded(
                        child: ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(comments[index].title),
                                    subtitle: Text(comments[index].subtitle),
                                  ),
                                  Divider(
                                    height: 0.5,
                                  ),
                                ],
                              );
                            }),
                      ),
                ),
              ],
            ),
          ),
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
