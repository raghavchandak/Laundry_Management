import 'package:flutter/material.dart';
import 'package:nih_laundro/Screens/DisplayScreen.screen.dart';
import 'Screens/HomePage.screen.dart';
import 'package:nih_laundro/Backend/shared_pref.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget page = Home();
  @override
  void initState()
  {
    super.initState();
    setScreen();
  }

  void setScreen() async
  {
    Widget currentPage = await StorageService().isTotal() ? DisplayScreen() : Home();
    setState(() {
      page = currentPage; 
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: page,
    );
  }
}
