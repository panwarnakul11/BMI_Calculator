import 'package:flutter/material.dart';
import 'screen/input_page.dart';
import 'screen/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
