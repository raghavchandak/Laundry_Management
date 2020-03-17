import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DoneButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 120.0),
      height: 50.0,
      child: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        splashColor: Colors.blueAccent,
        onPressed: this.onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
