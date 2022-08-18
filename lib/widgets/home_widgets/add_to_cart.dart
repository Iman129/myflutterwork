import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items!.contains(catalog)??false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
           isInCart = isInCart
            .toggle(); // it will make opposite of the variable ie if it was false now it will be true
         final _catalog = CatalogModel();
        
        _cart.catalog = _catalog; //setter is used of catalog
        _cart.add(catalog);
        //setState(() {}); //this will tell the changes
        }
       
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
