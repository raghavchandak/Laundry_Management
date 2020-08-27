import 'package:flutter/material.dart';
import 'package:nih_laundro/main.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:redux/redux.dart';
import 'package:nih_laundro/redux/actions.dart';

class ReusableCardRightSide extends StatelessWidget {
  final Store<AppState> store;
  final List<Cloth> clothes;
  final int clothNo;

  ReusableCardRightSide({this.clothNo, this.clothes, this.store});

  void dispatchDecreaseClothAction(int clothNo) {
    store.dispatch(DecreaseClothCount(clothNo: clothNo));
  }

  void dispatchIncreaseClothAction(int clothNo) {
    store.dispatch(IncreaseClothCount(clothNo: clothNo));
  }

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
          onPressed: () => dispatchDecreaseClothAction(clothNo),
        ),
        Text(
          '${clothes[clothNo].count}',
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
            onPressed: () => dispatchIncreaseClothAction(clothNo))
      ],
    );
  }
}
