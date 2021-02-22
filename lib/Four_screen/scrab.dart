import 'package:flutter/material.dart';

class scrabPage extends StatefulWidget {

  @override
  _scrabPageState createState() => _scrabPageState();
}

class _scrabPageState extends State<scrabPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }


  final List<String> entries = <String>['임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전'];

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
        title: Text('스크랩한 게시글', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: width(20),right: width(20)),
            color: Color(0xFFDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
        body: scrabPost_(),
    );
  }

  Widget scrabPost_(){
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(width(8),height(8),width(8),height(8)),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
            padding: EdgeInsets.fromLTRB(width(16),height(16),width(16),height(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(
                  '어제 내 세상이 무너졌어',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                    '${entries[index]}',
                    style: TextStyle(
                      color: Colors.grey,
                    )
                ),
              ],
            )
        );
      },
      separatorBuilder: (BuildContext context, int index)=> const Divider(),
    );
}

}