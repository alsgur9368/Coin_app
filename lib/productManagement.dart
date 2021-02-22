import 'package:flutter/material.dart';
import 'productAdd.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';

class productManage extends StatefulWidget {
  @override
  _productManageState createState() => _productManageState();
}



class _productManageState extends State<productManage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  List<Product> products = [
    Product(
        name: 'Unity 3D 게임 프로그래밍',
        count: 2,
        icon: Icon(Icons.menu_book, size: 28, color: Colors.white)),
    Product(
        name: 'TG 모니터',
        count: 8,
        icon: Icon(Icons.tv_outlined, size: 28, color: Colors.white)),
    Product(
      name: 'USB C Type 케이블',
      count: 10,
      icon:
      Icon(Icons.electrical_services_outlined, size: 28, color: Colors.white),
    ),
    Product(
      name: '십자 도라이',
      count: 0,
      icon: Icon(Icons.handyman_outlined, size: 28, color: Colors.white),
    ),
    Product(
      count: 3,
      name: '모나미 0.7mm 볼펜 Black',
      icon: Icon(Icons.mode_edit, size: 28, color: Colors.white),
    ),
    Product(name: '알기쉬운 자료구조-C언어', count: 1, icon: Icon(Icons.menu_book)),
    Product(
      name: 'iMac',
      count: 2,
      icon: Icon(Icons.tv_outlined, size: 28, color: Colors.white),
    ),
    Product(
      name: 'HDMI to DVI 케이블',
      count: 1,
      icon:
      Icon(Icons.electrical_services_outlined, size: 28, color: Colors.white),
    ),
    Product(
        name: '책',
        count: 15,
        icon: Icon(Icons.menu_book, size: 28, color: Colors.white)),
  ];

  TextEditingController itemController = TextEditingController();
  String filter;
  List<bool> isSelected;
  int borrowcount = 1;

  @override
  initState() {
    isSelected = [true, false];
    itemController.addListener(() {
      setState(() {
        filter = itemController.text;
      });
    });
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  showToast(BuildContext context, bool selectedToggle) {
    if (selectedToggle == true) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "        대여가 완료되었습니다.\n"
            "반납기한: ~2021년 2월 15일 (월)",
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14,
      );
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "반납되었습니다.",
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }

  void _onTapItem(BuildContext context, String borrowName, int borrowCount,
      Icon borrowIcon) {
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(
                        width(8), height(8), width(8), height(8)),
                    child: Row(children: [
                      CircleAvatar(
                        radius: width(25),
                        backgroundColor: Colors.blueAccent,
                        child: borrowIcon,
                      ),
                      SizedBox(
                        width: width(14),
                      ),
                      Flexible(
                        child: Container(
                          width: 200,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  borrowName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text('재고 ' + borrowCount.toString() + '개',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: borrowCount == 0
                                            ? Colors.red
                                            : Colors.green)),
                              ]),
                        ),
                      ),
                    ]),
                  ),
                  content: Container(
                    width: width(335),
                    height: height(320),
                    child: Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, height(20), 0, height(46)),
                          child: Container(
                            height: height(32),
                            child: ToggleButtons(
                              borderColor: Colors.grey,
                              fillColor: Colors.blueAccent,
                              borderWidth: 2,
                              selectedBorderColor: Colors.blueAccent,
                              selectedColor: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      width(37), 0, width(37), height(2)),
                                  child: Text(
                                    '대여',
                                    style: TextStyle(fontSize: width(16)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      width(37), 0, width(37), height(2)),
                                  child: Text(
                                    '반납',
                                    style: TextStyle(fontSize: width(16)),
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < isSelected.length; i++) {
                                    isSelected[i] = i == index;
                                  }
                                });
                              },
                              isSelected: isSelected,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              isSelected[0] == true
                                  ? Column(
                                      children: [
                                        SizedBox(height: height(20)),
                                        Text('대여하시겠습니까?'),
                                        Text('반납기한: ~2021년 2월 15일 (월)'),
                                        SizedBox(height: height(20)),
                                      ],
                                    )
                                  : (borrowcount > 0)
                                      ? Column(
                                          children: [
                                            Text('대여일자: 2020년 12월 30일 (수)'),
                                            Text('반납기한: ~2021년 1월 30일 (토)'),
                                            SizedBox(height: height(20)),
                                            Text('반납하시겠습니까?')
                                          ],
                                        )
                                      : Text('대여 내역이 없습니다.'),
                              SizedBox(height: height(50)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      width(68), 0, width(68), 0),
                                  child: DialogButton(
                                      color: Colors.blueAccent,
                                      child: isSelected[0] == true
                                          ? Text('대여하기',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold))
                                          : Text('반납하기',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                      onPressed: () =>
                                          showToast(context, isSelected[0]))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('비품관리', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: width(16))),
          actions: <Widget>[
            IconButton(
                padding: EdgeInsets.only(right: width(10)),
                icon: Icon(Icons.add_sharp, color: Colors.black,size: width(28),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductAdd()));
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(width(20), height(20), width(20), 0),
          child: Container(
            child: Column(
              children: [
                searchProduct_(),
                productList_(),
              ],
            ),
          ),
        ));
  }

  Widget searchProduct_() {
    return Padding(
      padding: EdgeInsets.fromLTRB(width(20), 0, width(20), height(20)),
      child: TextField(
        controller: itemController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: "검색어를 입력해주세요",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
      ),
    );
  }

  Widget productList_() {
    return Expanded(
      child: new ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return filter == null || filter == ""
              ? Column(
                  children: [
                    ListTile(
                      title: Text(
                        '${products[index].name}',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                          '재고 ' + products[index].count.toString() + '개',
                          style: TextStyle(
                              fontSize: 14,
                              color: products[index].count == 0
                                  ? Colors.red
                                  : Colors.green)),
                      leading: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.blueAccent,
                        child: products[index].icon,
                      ),
                      onTap: () => _onTapItem(context, products[index].name,
                          products[index].count, products[index].icon),
                    ),
                    Divider(
                      thickness: 0.5,
                    )
                  ],
                )
              : '${products[index].name}'
                      .toLowerCase()
                      .contains(filter.toLowerCase())
                  ? Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${products[index].name}',
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Text(
                              '재고 ' + products[index].count.toString() + '개',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: products[index].count == 0
                                      ? Colors.red
                                      : Colors.green)),
                          leading: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.blueAccent,
                            child: products[index].icon,
                          ),
                          onTap: () => _onTapItem(
                            context,
                            products[index].name,
                            products[index].count,
                            products[index].icon,
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        )
                      ],
                    )
                  : new Container();
        },
      ),
    );
  }
}

class Product {
  final String name;
  final int count;
  Icon icon;

  Product({this.name, this.count, this.icon});
}
