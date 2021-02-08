import 'package:flutter/material.dart';
import 'productAdd.dart';

class productManage extends StatefulWidget {
  @override
  _productManageState createState() => _productManageState();
}

List<Product> products = [
  Product(
      name: 'Unity 3D 게임 프로그래밍',
      count: '2',
      icon: Icon(Icons.menu_book, size: 28, color: Colors.white)),
  Product(
      name: 'TG 모니터',
      count: '8',
      icon: Icon(Icons.tv_outlined, size: 28, color: Colors.white)),
  Product(
    name: 'USB C Type 케이블',
    count: '10',
    icon:
        Icon(Icons.electrical_services_outlined, size: 28, color: Colors.white),
  ),
  Product(
    name: '십자 도라이',
    count: '0',
    icon: Icon(Icons.handyman_outlined, size: 28, color: Colors.white),
  ),
  Product(
    count: '3',
    name: '모나미 0.7mm 볼펜 Black',
    icon: Icon(Icons.mode_edit, size: 28, color: Colors.white),
  ),
  Product(name: '알기쉬운 자료구조-C언어', count: '1', icon: Icon(Icons.menu_book)),
  Product(
    name: 'iMac',
    count: '2',
    icon: Icon(Icons.tv_outlined, size: 28, color: Colors.white),
  ),
  Product(
    name: 'HDMI to DVI 케이블',
    count: '1',
    icon:
        Icon(Icons.electrical_services_outlined, size: 28, color: Colors.white),
  ),
  Product(
      name: '책',
      count: '15',
      icon: Icon(Icons.menu_book, size: 28, color: Colors.white)),
];

class _productManageState extends State<productManage> {
  TextEditingController itemController = TextEditingController();
  String filter;
  List<bool> isSelected;

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

  void _onTapItem(BuildContext context, String borrowName, String borrowCount,
      Icon borrowIcon) {
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                        child: borrowIcon,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              borrowName,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text('재고 ' + borrowCount + '개',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: borrowCount == '0'
                                        ? Colors.red
                                        : Colors.green)),
                          ]),
                    ]),
                  ),
                  content: Container(
                    width: 335,
                    height: 300,
                    child: Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 32,
                            child: ToggleButtons(
                              borderColor: Colors.grey,
                              fillColor: Colors.blue,
                              borderWidth: 2,
                              selectedBorderColor: Colors.blue,
                              selectedColor: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 37, right: 37, bottom: 2),
                                  child: Text(
                                    '대여',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 37, left: 37, bottom: 2),
                                  child: Text(
                                    '반납',
                                    style: TextStyle(fontSize: 16),
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
                        if (isSelected[0] == true)
                          Column(
                            children: [
                              Text(
                                '대여하시겠습니까?',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text('반납기한: ~2021년 2월 15일 (월)'),
                            ],
                          )
                        else
                          Column(
                            children: [
                              Text('대여일자: 2020년 12월 30일 (수)'),
                              Text('반납기한: ~2021년 1월 30일 (토)'),
                            ],
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
          backgroundColor: Colors.white,
          title: Center(
              child: Text('비품관리', style: TextStyle(color: Colors.black))),
          actions: [
            IconButton(
                icon: Icon(Icons.add, color: Colors.black, size: 36),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductAdd())))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 20.0, bottom: 20),
                  child: TextField(
                    controller: itemController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "검색어를 입력해주세요",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )),
                  ),
                ),
                Expanded(
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
                                      '재고 ' + products[index].count + '개',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: products[index].count == '0'
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
                                      products[index].icon),
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
                                          '재고 ' + products[index].count + '개',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  products[index].count == '0'
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
                ),
              ],
            ),
          ),
        ));
  }
}

class Product {
  final String name;
  final String count;
  final Icon icon;

  Product({this.name, this.count, this.icon});
}
