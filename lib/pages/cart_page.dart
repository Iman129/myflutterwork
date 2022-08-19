import 'package:flutter/material.dart';
import 'package:myfirst_app/models/cart.dart';
//import 'package:myfirst_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart ';
import 'package:provider/provider.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild happened"); //on console
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxBuilder(
          mutations: {RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) {
            print("rebuild happened"); //on removing an object
            return "\$${_cart.totalPrice}"
                .text
                .xl5
                // ignore: deprecated_member_use
                .color(context.theme.accentColor)
                .make();
          },
        ),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make()));
                },
                child: "Buy".text.white.make(),
                style: ButtonStyle(
                    // ignore: deprecated_member_use
                    backgroundColor:
                        // ignore: deprecated_member_use
                        MaterialStateProperty.all(context.theme.buttonColor)))
            .w24(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  //final _cart = CartModel();
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items!.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount:
                _cart.items?.length, //we can take length if it is not null
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              iconColor: context.accentColor,
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items![index]);
                },
              ),
              title: _cart.items![index].name.text
                  .color(context.accentColor)
                  .make(),
            ),
          );
  }
}
