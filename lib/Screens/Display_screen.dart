import 'package:flutter/material.dart';

class Display_screen extends StatelessWidget {
  List cloth;
  List count;

  Widget createWidget(int i) {
    if (count[i] != 0)
      return Row(
        children: <Widget>[
          Text(
            '${cloth[i]} :',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            count[i].toString(),
            style: TextStyle(color: Colors.black),
          ),
        ],
      );
    else
      return Container(
        height: 0.0,
        width: 0.0,
      );
  }

  Display_screen({this.cloth, this.count});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Laundry Management',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Container(
        color: Colors.brown.shade300,
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
          ),
          child: ListView(
            children: <Widget>[
              for (int i = 0; i < count.length; i++) createWidget(i),
            ],
          ),
        ),
      ),
    );
  }
}
