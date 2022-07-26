import 'package:flutter/material.dart';
import 'package:myfirst_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    double dem = 4.5;
    //String name = "Iman's";
    //var op = 5;
    //var day = 3.6;
    //const pi = 3.14; //constant value

    return MaterialApp(
      home: HomePage(),
      );
  }
}
