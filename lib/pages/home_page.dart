// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
//import 'dart:ui';

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirst_app/models/catalog.dart';
import 'package:myfirst_app/widgets/themes.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';



//import '../widgets/drawer.dart';
//import '../widgets/item_widget.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //text left se start hoga
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().p16().expand()
                else
                  
                  CircularProgressIndicator().centered().expand(), //so our indicator will be in center
                  
              ],
            ),
          ),
        ));
  }
}








