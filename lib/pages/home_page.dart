import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myfirst_app/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    double dem = 4.5;
    String name = "Iman's";
    final dummylist=List.generate(10,(index) => CatalogModel.items[0]);

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.amber,
          title: Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummylist.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item:dummylist[index]
                );
            },
          ),
        ),
        drawer: MyDrawer() //backgroundColor: Colors.blue,),
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
