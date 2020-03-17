import 'package:flutter/material.dart';
import 'Screens/HomePage.screen.dart';
import 'package:nih_laundro/Backend/shared_pref.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Home(),
    );
  }
}
