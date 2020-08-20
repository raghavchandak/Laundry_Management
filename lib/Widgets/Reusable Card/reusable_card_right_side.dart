import 'package:flutter/material.dart';
import 'package:nih_laundro/main.dart';

class ReusableCardRightSide extends StatelessWidget {
  final ViewModel model;
  final int clothNo;

  ReusableCardRightSide({this.clothNo, this.model});

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
          onPressed: () => model.onDecreaseCloth(clothNo),
        ),
        Text(
          '${model.clothes[clothNo].count}',
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
          onPressed: () => model.onIncreaseCloth(clothNo),
        )
      ],
    );
  }
}
