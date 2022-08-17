import 'package:flutter/material.dart';
import 'package:myfirst_app/models/cart.dart';
//import 'package:myfirst_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart ';

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
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // ignore: deprecated_member_use
        "\$${_cart.totalPrice}".text.xl4.color(context.theme.accentColor).make(), //total price
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

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  final _cart = CartModel();
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length, //we can take length if it is not null
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        iconColor: context.accentColor,
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
        title: _cart.items![index].name.text.color(context.accentColor).make(),
      ),
    );
  }
}
