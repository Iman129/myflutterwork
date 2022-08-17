import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfirst_app/models/cart.dart';
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
          final catalog = CatalogModel
              .items[index]; // same as before all list shows on home
          return InkWell //inkwell will give us something on tapping the button
              (
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog))),
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
        Hero //fort annimations
            (
                tag: Key(catalog.id.toString()),
                child: CatalogImage(
                  image: catalog.image,
                )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(context.accentColor).make(),
            catalog.desc.text
                .textStyle(context.captionStyle)
                .color(context.accentColor)
                .make(),
            10.heightBox, //used as sized box
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero, //khali right se padding
              children: [
                "\$${catalog.price}"
                    .text
                    .bold
                    .color(context.accentColor)
                    .xl
                    .make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 20)
          ],
        )) //width will be adjhusted
      ],
    ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py16(); //py=padding vertically along y axis
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded
            .toggle(); // it will make opposite of the variable ie if it was false now it will be true

        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog; //setter is used of catalog
        _cart.add(widget.catalog);
        setState(() {}); //this will tell the changes
      },
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
