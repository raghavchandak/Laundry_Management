import 'package:flutter/material.dart';
import 'package:nih_laundro/Widgets/Reusable Card/reusable_card_right_side.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:redux/redux.dart';

class ReusableCard extends StatelessWidget {
  final Store<AppState> store;
  final List<Cloth> clothes;
  final int clothNo;

  ReusableCard({this.clothes, this.clothNo, this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: AssetImage('images/${clothes[clothNo].clothName}.jpeg'),
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
                  '${clothes[clothNo].clothName}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Price: Rs. ${clothes[clothNo].price}',
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
            child: ReusableCardRightSide(
              clothNo: clothNo,
              clothes: clothes,
              store: store,
            ),
          )
        ],
      ),
    );
  }
}
