import 'package:flutter/material.dart';
import 'dart:async';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';


class QrcodeScan extends StatefulWidget {
  @override
  _QrcodeScanState createState() => _QrcodeScanState();
}

class _QrcodeScanState extends State<QrcodeScan> {
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
        title: Text('출석체크'),
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
        AppSettings.openAppSettings();
      }
    });
    return per;
  }
}