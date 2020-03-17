import 'package:flutter/material.dart';
import 'package:nih_laundro/Utilities/Cloth.dart';

class ReusableCardRightSide extends StatefulWidget {
  final int clothNo;
  ReusableCardRightSide({this.clothNo});
  
  @override
  _ReusableCardRightSideState createState() => _ReusableCardRightSideState();
}

class _ReusableCardRightSideState extends State<ReusableCardRightSide> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.remove,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
//                      increment cloth count at position
              if (Cloth.CLOTH_LIST[widget.clothNo].count > 0){
                Cloth.CLOTH_LIST[widget.clothNo].count--;
              }
            });
          },
        ),
        Text(
          '${Cloth.CLOTH_LIST[widget.clothNo].count}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.black),
          onPressed: () {
            setState(
              () {
                // increment cloth count
                Cloth.CLOTH_LIST[widget.clothNo].count++;
              },
            );
          },
        )
      ],
    );
  }
}
