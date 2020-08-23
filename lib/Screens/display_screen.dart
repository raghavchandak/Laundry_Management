import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nih_laundro/main.dart';

class DisplayScreen extends StatelessWidget {
  final ViewModel model;

  const DisplayScreen({Key key, this.model}) : super(key: key);

  int getTotal() {
    int total = 0;

    for (int i = 0; i < model.clothes.length; i++) {
      total += model.clothes[i].count * model.clothes[i].price;
    }

    return total;
  }

  Widget createWidget(int i) {
    if (model.clothes[i].count != 0)
      return Card(
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          height: 50.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(7.5),
            color: Colors.purple,
            gradient: new LinearGradient(
              colors: [Color(0xFFF7D7D7), Color(0xFFF8BBD0)],
            ),
          ),
          child: Row(
            children: <Widget>[
              Text(
                '${model.clothes[i].clothName} : ',
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.clothes[i].count.toString(),
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Management'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.brown.shade300,
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      for (int i = 0; i < model.clothes.length; i++)
                        createWidget(i),
                    ],
                  ),
                ),
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    height: 45.0,
                    width: MediaQuery.of(context).size.width * 1,
                    color: Color(0xFF2282B9),
                    child: Row(
                      children: <Widget>[
                        Icon(EvilIcons.chevron_right,
                            size: 25.0, color: Colors.white),
                        Icon(EvilIcons.chevron_right,
                            size: 25.0, color: Colors.white),
                        Icon(EvilIcons.chevron_right,
                            size: 25.0, color: Colors.white),
                        Center(
                          child: Text(
                            'Total : Rs. ${getTotal().toString()} + Miscellanous',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Save',
                      color: Color(0xFF4EB44B),
                      icon: Icons.check,
                      foregroundColor: Colors.white,
                      onTap: () => model.onSaveClothes(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
