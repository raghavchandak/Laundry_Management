import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DoneButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenheight * 0.03, horizontal: screenwidth * 0.1),
      height: screenheight * 0.06,
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
