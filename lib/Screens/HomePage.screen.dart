import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nih_laundro/Screens/DisplayScreen.screen.dart';
import 'package:nih_laundro/Utilities/Cloth.dart';
import 'package:nih_laundro/Widgets/doneButton.widget.dart';
import 'package:nih_laundro/Widgets/reusableCard/resuableCard.widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Laundry'),
          ),
          body: Column(
            children: <Widget>[
              // clothes list GUI
              Expanded(
                child: ListView.builder(
                    itemCount: Cloth.CLOTH_LIST.length,
                    itemBuilder: (BuildContext ctxt, int i) {
                      return ReusableCard(
                        cloth: Cloth.CLOTH_LIST[i].type,
                        clothNo: i,
                        price: Cloth.CLOTH_LIST[i].price,
                        quantity: Cloth.CLOTH_LIST[i].count,
                      );
                    }),
              ),
              DoneButton(
                  text: 'Done', onPressed: () => toDisplayScreen(context))
            ],
          )),
    );
  }

  void toDisplayScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DisplayScreen(),
      ),
    );
  }
}
