import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class GoogleDrive extends StatefulWidget {
  GoogleDrive({Key key}) : super(key: key);

  @override
  _GoogleDriveState createState() => _GoogleDriveState();
}

class _GoogleDriveState extends State<GoogleDrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://drive.google.com',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
