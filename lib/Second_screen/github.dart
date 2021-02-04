import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class GitHub extends StatefulWidget {
  GitHub({Key key}) : super(key: key);

  @override
  _GitHubState createState() => _GitHubState();
}

class _GitHubState extends State<GitHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://github.com/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}