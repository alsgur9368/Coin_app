import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coin_main/freeBoard.dart';

class boardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: <Widget>[
          SizedBox(height:20.0),
          ExpansionTile(
            leading: SvgPicture.asset('images/coin_source/icon_board_folder_18px.svg'),
            title:
            Text(
              "STUDY",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            trailing: Icon(Icons.add),
            children: <Widget>[
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  '   ㆍ과제',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  '   ㆍ학습노트',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  '   ㆍ학습계획표',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              'ㆍ공모전',
              style: TextStyle(fontWeight:FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              'ㆍQ&A',
              style: TextStyle(fontWeight:FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              'ㆍ건의하기',
              style: TextStyle(fontWeight:FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              'ㆍ자유게시판',
              style: TextStyle(fontWeight:FontWeight.bold),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Free())),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}