import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class rentPage extends StatelessWidget {
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

  Future<bool> _returnButton(BuildContext context) async {
    Alert(
        context: context,
        title: '\'컴퓨터구조학\'을 반납하시겠습니까?',
        style: AlertStyle(titleStyle: TextStyle(fontSize: 12)),
        buttons: [
          DialogButton(
              child: Text('반납',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.pop(context)),
          DialogButton(
              color: Colors.white10,
              child: Text('취소',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.pop(context))
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildSlidable(context, index, item);
        },
      ),
    );
  }

  Widget _buildSlidable(BuildContext context, index, item) {
    return Container(
      child: Column(
        children: [
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: SvgPicture.asset(
                    'images/coin_source/icon_equipment_book_44px.svg',
                    height: 44,
                    width: 44,
                  ),
                  foregroundColor: Colors.white,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(items[index],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(rent_dates[index], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(children: [
                      Text(return_dates[index],
                          style: TextStyle(fontSize: 12, color: Colors.red)),
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
            height: 1,
          )
        ],
      ),
    );
  }
}