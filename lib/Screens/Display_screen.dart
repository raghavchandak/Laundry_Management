import 'package:flutter/material.dart';

class Display_screen extends StatelessWidget {
  List cloth;
  List count;
  int total;

  Widget createWidget(int i) {
    if (count[i] != 0)
      return Card(
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          height: 50.0,
          decoration: new BoxDecoration(
            color: Colors.purple,
            gradient: new LinearGradient(
              colors: [Colors.white, Color(0xFFFF80AB)],
            ),
          ),
          child: Row(
            children: <Widget>[
              Text(
                '${cloth[i]} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                count[i].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )
              ),
            ],
          ),
        ),
      );
    else
      return Container(
        height: 0.0,
        width: 0.0,
      );
  }

  Display_screen({this.cloth, this.count, this.total});

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
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                for (int i = 0; i < count.length; i++) createWidget(i),
                Text('- - - - - - - - - - - - - - - - - - - -'),
                Text(
                    'Total : Rs. $total , and cost of miscellaneous items, if any'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
