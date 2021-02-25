import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class QrcodeScan extends StatefulWidget {
  @override
  _QrcodeScanState createState() => _QrcodeScanState();
}

class _QrcodeScanState extends State<QrcodeScan> {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  String _urlQR = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black, size: width(28)),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('출석', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff191919), fontSize: width(16))),
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.fromLTRB(width(20), 0, width(20), 0),
            color: Color(0xffDBDBDB),
            height: height(1),
          ),
          preferredSize: Size.fromHeight(height(1)),
        ),
      ),
      body: Builder(
        builder: (BuildContext context){
          _launcherURL(_urlQR);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_urlQR),
                RaisedButton(onPressed: (){
                  _scan();
                }),
              ],
            ),
          );
        },
      ),
    );
  }
  _launcherURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
  Future _scan() async{
    String Qrcode = await scanner.scan();
    setState(() {
      _urlQR = Qrcode;
    });
  }
  Future<bool> checkPermission() async{
    Map<Permission, PermissionStatus> statuses = await[Permission.camera].request();

    bool per = true;

    statuses.forEach((permission, permissionStatus) {
      if(!permissionStatus.isGranted){
        per = false;
      }
    });
    return per;
  }
}