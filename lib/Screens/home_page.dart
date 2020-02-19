import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nih_laundro/Utilities/Resuable_card.dart';
import 'Display_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> clothes = [
    'Shirt',
    'T-Shirt',
    'Jeans',
    'Shorts',
    'Tracks',
    'Bedsheet',
    'Hanky',
    'Vest',
    'Underwear',
    'Towel',
    'Socks',
    'Shoes',
    'Misc'
  ];

  var clothcount = new List<int>.generate(13, (i) => i = 0);

/*
  List<Widget> createDisplayScreenWidgetList(List<int> clothPositions) {
    List<Widget> finalWidgetList;
    for (int i = 0; i < clothPositions.length; i++) {
      if (clothPositions[i] != 0) {
        finalWidgetList.add(
          Row(
            children: <Widget>[
              Text(
                '${this.clothes[i]} :',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                clothPositions[i].toString(),
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }
    }
    return finalWidgetList;
  }
*/

//  0: increase, 1: decrease
  void changeClothCount(int i, int j) {
    if (j == 0) this.clothcount[i]++;
    if (j == 1) this.clothcount[i]--;
  }

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
        body: ListView(
          children: <Widget>[
            // clothes list GUI
            SizedBox(
              height: 650, //TODO: Hardcoded rn, make relative later
              child: ListView.builder(
                  itemCount: clothes.length,
                  itemBuilder: (BuildContext ctxt, int i) {
                    return new Reusable_card(
                      changeClothCount: changeClothCount,
                      cloth: clothes[i],
                      clothNo: i,
                    );
                  }),
            ),

            // Done Button
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 120.0),
              height: 50.0,
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Display_screen(
                        cloth: clothes, // List<String>
                        count: clothcount, // List<int>
                      ),
                    ),
                  );
                },
                child: Text(
                  "Done!",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ));
  }
}
