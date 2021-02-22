import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class createPost extends StatefulWidget {
  @override
  _createPostState createState() => _createPostState();
}

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

class _createPostState extends State<createPost> {
  final textEditingController = TextEditingController();
  PickedFile _image;
  String _chosenValue;

  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
        title: Text('글 작성하기',
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
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "제목",
              ),
            ),
          ),
          Container(
            height: 60,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _chosenValue,
              items: <String>[
                "과제",
                "학습노트",
                "학습계획표",
                "공모전",
                "Q&A",
                "건의하기",
                "자유게시판",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text("카테고리"),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),
          _image == null ? Text('') : Image.file(File(_image.path)),
          Container(
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "글을 작성해주세요",
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                      "images/coin_source/icon_camera_30px.svg"),
                  onPressed: () {
                    _getImage(ImageSource.gallery);
                  },
                ),
                IconButton(
                  icon:
                      SvgPicture.asset("images/coin_source/icon_filw_30px.svg"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    setState(() {
      _image = image;
    });
  }
}
