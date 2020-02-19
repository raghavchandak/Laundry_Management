import 'package:flutter/material.dart';

class Reusable_card extends StatefulWidget {
  String cloth;
  int clothNo;
  int price;

  Function(int, int) changeClothCount;

  Reusable_card({this.cloth, this.clothNo, this.changeClothCount,this.price});

  @override
  _Reusable_cardState createState() => _Reusable_cardState();
}

class _Reusable_cardState extends State<Reusable_card> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: AssetImage('images/${widget.cloth}.jpeg'),
          colorFilter: ColorFilter.mode(
              Colors.brown.withOpacity(0.55), BlendMode.hardLight),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(15.0),
      height: 177.5,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.cloth}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Price: Rs. ${widget.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
//                      increment cloth count at position
                      widget.changeClothCount(widget.clothNo, 0);
                      quantity++;
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.remove, color: Colors.black),
                  onPressed: () {
                    setState(
                      () {
//                           decrement cloth count
                        if (quantity > 0) {
                          widget.changeClothCount(widget.clothNo, 1);
                          quantity--;
                        }
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
