import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirst_app/models/catalog.dart';
import 'dart:convert';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //this json variable has our file
    final decodedData = jsonDecode(catalogJson);
    var productsData =
        decodedData["products"]; //decoded data ma se sirf proiducts chahiye
    // ignore: unused_local_variable
    CatalogModel.items = List.from(productsData)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
    // print(productsData); //sab items agaye
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    double dem = 4.5;
    String name = "Iman's";

    //final dummylist = List.generate(10, (index) => CatalogModel.items[0]);

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.amber,
          title: Text("Catalog App"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.items?.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(item: CatalogModel.items[index]);
                    }, //we can use => instead of return 
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
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
