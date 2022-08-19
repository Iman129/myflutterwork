import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart%20';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
   // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items!.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
         
          AddMutation(catalog);
        
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
