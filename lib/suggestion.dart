import 'package:flutter/material.dart';
import 'createPost.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  FocusNode _passwordFocusNode = FocusNode();
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('건의하기',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_sharp, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => createPost()));
              }),
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: 2,
          ),
          preferredSize: Size.fromHeight(2),
        ),
      ),
      body: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 25),
                  title: Text(suggestionList[index].stitle),
                  subtitle: Text(suggestionList[index].stime),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            titlePadding: EdgeInsets.only(top: height(40),bottom: height(20)),
                            title: Center(
                              child: Text(
                                '비밀번호를 입력하세요.',
                                style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: width(14)),
                              ),
                            ),
                            content: SizedBox(
                              height: height(220),
                              child: Column(
                                children: [
                                  Container(
                                    width: width(240),
                                    height: height(90),
                                    child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        focusNode: _passwordFocusNode,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFFCFCFC),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF191919)),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "비밀번호를 입력하세요";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) => _password = value,
                                        obscureText: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: height(40)),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        onPressed: () {
                                          if(_formKey.currentState.validate()){

                                          }
                                        },
                                        child: Text('확인', style: TextStyle(color: Color(0xFFF9F9F9)),),
                                    color: Color(0xFF3677DC),
                                  )),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
                Divider(
                  thickness: 1.0,
                  endIndent: 20,
                  indent: 20,
                ),
              ],
            );
          }),
    );
  }
}

List<SuggestionPost> suggestionList = <SuggestionPost>[
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
  SuggestionPost(
    stitle: '건의하기',
    stime: '1시간 전',
  ),
];

class SuggestionPost {
  final String stitle;
  final String stime;

  SuggestionPost({this.stitle, this.stime});
}
