import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class rentPage extends StatefulWidget {
  @override
  _rentPageState createState() => _rentPageState();
}

class _rentPageState extends State<rentPage> {

  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }


  List<String> items = ['컴퓨터구조학', '컴퓨터구조학', '컴퓨터구조학', '자바 프로그래밍 바이블'];

  List<String> rent_dates = [
    '2021년 1월 15일 (금) 대여',
    '2021년 1월 15일 (금) 대여',
    '2021년 1월 15일 (금) 대여',
    '2021년 1월 15일 (금) 대여',
  ];

  List<String> return_dates = [
    '2021년 2월 15일 (금)',
    '2021년 2월 15일 (금)',
    '2021년 2월 15일 (금)',
    '2021년 2월 15일 (금)',
  ];

  showToast(BuildContext context) {
    Navigator.pop(context);
    Fluttertoast.showToast(
      msg: "반납되었습니다",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xff505050),
      textColor: Colors.white,
      fontSize: 14,
    );
  }

  Future<bool> _returnButton(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Container(
                width: width(335),
                height: height(180),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                    ),
                    Text('\'컴퓨터구조학\'을 반납하시겠습니까?',
                        style: TextStyle(fontSize: width(14))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          minWidth: width(120),
                          height: height(48),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blueAccent,
                            child: Text('반납',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () => showToast(context),
                          ),
                        ),
                        SizedBox(width: width(10)),
                        ButtonTheme(
                          minWidth: width(120),
                          height: height(48),
                          child: RaisedButton(
                            color: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((10))),
                            child: Text('취소',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    )
                  ],

                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: width(28),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('대여 이력',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: width(16))),
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: width(20), right: width(20)),
            color: Color(0xFFDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildSlidable_(context, index, item);
        },
      ),
    );
  }

  Widget buildSlidable_(BuildContext context, index, item) {
    return Container(
      child: Column(
        children: [
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width(10), height(10), width(10), height(10)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: SvgPicture.asset(
                    'images/coin_source/icon_equipment_book_44px.svg',
                    height: height(44),
                    width: width(44),
                  ),
                  foregroundColor: Colors.white,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(rent_dates[index],
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Column(children: [
                      Text(return_dates[index],
                          style: TextStyle(
                              fontSize: width(12), color: Colors.red)),
                    ])
                  ],
                ),
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: '반납',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => {_returnButton(context)},
              ),
            ],
          ),
          Divider(
            color: Color(0xffDBDBDB),
            thickness: 0.8,
            indent: width(20),
            endIndent: width(20),
          )
        ],
      ),
    );
  }
}
