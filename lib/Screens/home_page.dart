import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nih_laundro/Utilities/Resuable_card.dart';
import 'Display_screen.dart';
import 'package:nih_laundro/Backend/shared_pref.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //TODO: Create a model folder, make Home class, encapsulate and import.
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

  List<int> prices = [14,12,15,11,15,30,4,10,10,15,8,80,0];

  var clothcount = new List<int>.generate(13, (i) => i = 0);

//  0: increase, 1: decrease
  void changeClothCount(int i, int j) {
    setState(() {
      if (j == 0) this.clothcount[i]++;
      if (j == 1) this.clothcount[i]--;
    });
  }

  int getTotal()
  {
    int total = 0;
    for(int i = 0; i < prices.length; i++)
    {
      total+= clothcount[i] * prices[i];
    }
    return total;
  }

  //TODO: Extract Scaffold widgets into their own reusable components, in Utilities.
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
                      price: prices[i],
                      quantity: clothcount[i],
                    );
                  }),
            ),

            //TODO: Done Button - Extract to Utils and Extract func also
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
                        total : getTotal(),
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
