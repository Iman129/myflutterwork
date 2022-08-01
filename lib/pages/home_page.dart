import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    double dem = 4.5;
    String name = "Iman's";

     return Scaffold(
      appBar: AppBar(//backgroundColor: Colors.amber,
      title: Text("Doctor's App"),),
      body: Center(
        child: Container(
          child: Text("welcome to $name first app in days $days and $dem"),
        ),
      ),
      drawer: MyDrawer()//backgroundColor: Colors.blue,),
     // backgroundColor: Colors.blueGrey,
    );
    
      //return Material(
      //child: Center(
       // child: Container(
         // child: Text("welcome to $name first app in days $days and $dem"),
        //),
      //),
    //);
  }
}

