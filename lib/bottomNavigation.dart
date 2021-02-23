import 'package:coin_main/First_screen/homePage.dart';
import 'package:coin_main/Four_screen/myPage.dart';
import 'package:coin_main/Second_screen/shortcutPage.dart';
import 'package:coin_main/Third_screen/boardPage.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;


  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff3677DC),
        unselectedItemColor: Color(0xffDBDBDB),
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: '',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
