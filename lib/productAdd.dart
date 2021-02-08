import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
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
              child: Text("Welcome to AndroidVille!"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title:
            Center(child: Text('비품신청', style: TextStyle(color: Colors.black))),
        actions: [
          TextButton(
              onPressed: () => displayBottomSheet(context),
              child: Text(
                '완료',
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: TextField(
                controller: productNameController,
                decoration: InputDecoration(
                    hintText: ' 비품명',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 48,
                  child: OutlineDropdownButton(
                      isExpanded: true,
                      isDense: false,
                      hint: Text('카테고리'),
                      value: _selectedText,
                      items: <String>['book', 'tool', 'cable', 'mornitor']
                          .map((value) {
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
                  width: 180,
                  height: 48,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(
              height: 250,
              width: 370,
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
          ),
        ],
      ),
    );
  }
}
