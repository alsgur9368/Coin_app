import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'main.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Secure Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(
        title: 'loginPage',
      ),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPage createState() => _MyLoginPage();
}

class _MyLoginPage extends State<MyLoginPage> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  String _id;
  String _password;

  final formKey = new GlobalKey<FormState>();

  TextEditingController idController;
  TextEditingController passController;
  String userInfo = ""; //user의 정보를 저장하기 위한 변수

  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (context) => MainPage(
                  id: idController.text,
                  pass: passController.text,
                )),
      );
    }
  }

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    passController = TextEditingController();
    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(userInfo);
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = await storage.read(key: "login");
    print(userInfo);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userInfo.split(" ")[1] == "sungho" &&
        userInfo.split(" ")[3] == "1111") {
      print(userInfo.split(" ")[1]);
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => MainPage(
                    id: userInfo.split(" ")[1],
                    pass: userInfo.split(" ")[3],
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/coin_source/loginPng.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(width(10), height(10), width(10), height(10)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/coin_source/LOGO.png',
                  width: width(50),
                  height: height(50),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: height(100),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(width(20), 0, width(20), height(20)),
                        child: Container(
                          height: height(88),
                          child: TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return '아이디를 입력해주세요';
                              }
                              if (value != 'sungho') {
                                return '아이디를 확인해주세요';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _id = value;
                            },
                            controller: idController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '아이디',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(width(20), 0, width(20), height(30)),
                        child: Container(
                          height: height((88)),
                          child: TextFormField(
                            validator: (String value) {
                              if (value != '1111') {
                                return '비밀번호를 확인해주세요';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              _password = value;
                            },
                            controller: passController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '비밀번호',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                )),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: width(335),
                    height: height(44),
                    child: FlatButton(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide.none),
                            disabledColor: Colors.grey,
                            onPressed: () async {
                              // write 함수를 통하여 key에 맞는 정보를 적게 됩니다.
                              //{"login" : "id id_value password password_value"}
                              //와 같은 형식으로 저장이 된다고 생각을 하면 됩니다.
                              await storage.write(
                                  key: "login",
                                  value: "id " +
                                      idController.text.toString() +
                                      " " +
                                      "password " +
                                      passController.text.toString());
                              _login();
                            },
                            child: Text("로그인",
                                style: TextStyle(
                                    color: Colors.white, fontSize: width(18))),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
