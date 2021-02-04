import 'package:flutter/material.dart';


class myhistoryPage extends StatefulWidget {
  @override
  _myhistoryPageState createState() => _myhistoryPageState();
}

class _myhistoryPageState extends State<myhistoryPage> {
  List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'asdasd'
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                ToggleButtons(
                  borderColor: Colors.grey,
                  fillColor: Colors.blue,
                  borderWidth: 2,
                  selectedBorderColor: Colors.blue,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '내가 쓴 글',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '내가 쓴 댓글',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  onPressed: (int index){
                    setState(() {
                      for(int i = 0; i < isSelected.length; i++){
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

