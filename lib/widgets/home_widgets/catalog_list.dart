import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfirst_app/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  //get catalog => null;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index]; // same as before all list shows on home
          return InkWell //inkwell will give us something on tapping the button
          (
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
        });
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Hero    //fort annimations
        (
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image,)),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            catalog.name.text.bold.lg.color(context.accentColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).color(context.accentColor).make(),
            10.heightBox, //used as sized box
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero, //khali right se padding
              children: [
                "\$${catalog.price}".text.bold.color(context.accentColor).xl.make(),
                ElevatedButton(onPressed: (){}, child: "Add to cart".text.make(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),
                
                )
              ],
            ).pOnly(right: 20)
          ],
        ))//width will be adjhusted
      ],
    ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py16(); //py=padding vertically along y axis
  }
}