import 'package:coin_main/notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'github.dart';
import 'google_drive.dart';
import 'package:coin_main/productManagement.dart';
class shortcutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notice()));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Row(
                children: [
                  SvgPicture.asset("images/coin_source/icon_notice_44px.svg" ),
                  SizedBox(width: 14),
                  Text("공지사항"),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300], thickness: 2, indent: 20, endIndent: 20),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>productManage()));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                children: [
                  SvgPicture.asset("images/coin_source/icon_equipment_44px.svg"),
                  SizedBox(width: 14),
                  Text("비품관리"),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300], thickness: 2, indent: 20, endIndent: 20),
          InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleDrive()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                children: [
                  SvgPicture.asset("images/coin_source/icon_googledrive_44px.svg"),
                  SizedBox(width: 14),
                  Text("Google Drive"),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300], thickness: 2, indent: 20, endIndent: 20),
          InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GitHub()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                children: [
                  SvgPicture.asset("images/coin_source/icon_github_44px.svg"),
                  SizedBox(width: 14),
                  Text("Github"),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300], thickness: 2, indent: 20, endIndent: 20),
        ],
      ),
    );
  }
}
