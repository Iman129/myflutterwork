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
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16
                    ), //2 items in one row),
                    itemBuilder: (context, index) {
                      final item = CatalogModel.items[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10) ),
                        child: GridTile(
                          header: Container(
                            child: Text(item.name,style: TextStyle(color: Colors.white)),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: Colors.pink),
                            //color: Colors.pink,
                            ),
                          child: Image.network(item.image),
                          footer: Container(
                            child: Text(item.price.toString(),style: TextStyle(color: Colors.white)),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: Colors.black),
                            //color: Colors.pink,
                            ),
                        ),
                      ); },
                    itemCount: CatalogModel.items.length,
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
