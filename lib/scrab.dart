import 'package:flutter/material.dart';

class scrabPage extends StatelessWidget {

  final List<String> entries = <String>['임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전','임진우ㆍ1시간 전'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'asdasd'
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      '어제 내 세상이 무너졌어',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        '${entries[index]}',
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ],
                )
            );
          },
          separatorBuilder: (BuildContext context, int index)=> const Divider(),
        )
    );
  }
}