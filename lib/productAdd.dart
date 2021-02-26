import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController productExplainController = TextEditingController();
  String _selectedText = "book";

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Text("완료"),
            ),
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
        title: Text('비품신청',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: width(16))),
        actions: [
          Container(
            padding: EdgeInsets.only(right: width(10)),
            child: TextButton(
              onPressed: () => displayBottomSheet(context),
              child: Text(
                '완료',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: width(16)),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: width(20), right: width(20)),
            color: Color(0xFFDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: Column(
        children: [
          productName_(),
          productCategory_(),
          productIntroduce_(),
        ],
      ),
    );
  }

  Widget productName_() {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(width(20), height(10), width(20), height(10)),
      child: TextField(
          controller: productNameController,
          decoration: InputDecoration(
              hintText: ' 비품명',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)))),
    );
  }

  Widget productCategory_() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(width(6), 0, 0, 0),
          width: width(167),
          height: height(48),
          child: OutlineDropdownButton(
              isExpanded: true,
              isDense: false,
              hint: Text('카테고리'),
              value: _selectedText,
              items: <String>['book', 'tool', 'cable', 'mornitor'].map((value) {
                return new DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectedText = val;
                });
              }),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, width(6), 0),
          width: width(167),
          height: height(48),
          child: TextField(
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: InputDecoration(
                  suffixText: '원',
                  hintText: ' 가격',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)))),
        ),
      ],
    );
  }

  Widget productIntroduce_() {
    return Padding(
      padding: EdgeInsets.fromLTRB(width(20), height(10), width(20), 0),
      child: Container(
        height: height(250),
        width: width(370),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(),
        ),
        child: TextFormField(
          cursorColor: Colors.black,
          minLines: 1,
          maxLines: 12,
          controller: productExplainController,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            hintText: '글을 작성해주세요',
          ),
        ),
      ),
    );
  }
}
