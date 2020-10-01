import 'package:flutter/material.dart';
import 'package:nih_laundro/main.dart';
import 'package:nih_laundro/model/model.dart';
import 'package:nih_laundro/redux/actions.dart';
import 'package:redux/redux.dart';

class ResetButton extends StatelessWidget {
  final Store<AppState> store;

  const ResetButton({Key key, this.store}) : super(key: key);

  void dispatchResetCount() {
    store.dispatch(ResetPrefsVariable());
    store.dispatch(ResetCount());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 45.0,
      child: FlatButton(
        color: Color(0xFF2282B9),
        child: Text(
          'Reset',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          dispatchResetCount();
          Navigator.of(context).pushReplacement(
            new MaterialPageRoute(
              builder: (BuildContext context) => MyApp(),
            ),
          );
        },
      ),
    );
  }
}
