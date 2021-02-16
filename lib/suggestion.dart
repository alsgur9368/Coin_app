import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  FocusNode _passwordFocusNode = FocusNode();
  String _password = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('건의하기'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){}),
        ],
      ),
      body: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  title: Text(suggestionList[index].stitle),
                  subtitle: Text(suggestionList[index].stime),
                  onTap: (){
                    showDialog(context: context,builder: (BuildContext context){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        title: Text('비밀번호를 입력해주세요.'),
                        content: Form(
                          key: _formKey,
                          child: TextFormField(
                          focusNode: _passwordFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return "비밀번호를 입력하세요";
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                          obscureText: true,
                        ),),
                        actions: [
                          FlatButton(onPressed: (){
                            if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                            }
                            }, child: Text('submit')),
                        ],
                      );
                    });
                  },
                ),
                Divider(
                  thickness: 1.0,
                  endIndent: 25,
                  indent: 25,
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

  SuggestionPost({this.stitle,this.stime});
}