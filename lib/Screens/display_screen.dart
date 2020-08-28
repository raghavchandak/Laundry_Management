import 'package:flutter/material.dart';
import 'package:nih_laundro/Widgets/reset_button.dart';
import 'package:nih_laundro/Widgets/save_button.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:redux/redux.dart';

class DisplayScreen extends StatelessWidget {
  final Store<AppState> store;

  const DisplayScreen({Key key, this.store}) : super(key: key);

  Widget createWidget(int i) {
    if (store.state.clothes[i].count != 0)
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
                '${store.state.clothes[i].clothName} : ',
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store.state.clothes[i].count.toString(),
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
                      for (int i = 0; i < store.state.clothes.length; i++)
                        createWidget(i),
                    ],
                  ),
                ),
                SaveButton(
                  store: store,
                ),
                SizedBox(
                  height: 5.0,
                ),
                ResetButton(
                  store: store,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
