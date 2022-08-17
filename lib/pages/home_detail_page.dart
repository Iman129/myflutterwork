import 'package:flutter/material.dart';
import 'package:myfirst_app/models/catalog.dart';
import 'package:myfirst_app/widgets/home_widgets/add_to_cart.dart';
import 'package:myfirst_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  final ImageErrorWidgetBuilder? errorBuilder;
  const HomeDetailPage({Key? key, required this.catalog, this.errorBuilder})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ), //it will give back button
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero, //khali right se padding
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
          AddToCart(catalog: catalog).wh(120,50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(
                      catalog.image,
                      errorBuilder: (context, error, stackTrace) {
                        return Text("data");
                      },
                    ).h40(context).centered())
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(context.theme.accentColor)
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .color(context.theme.accentColor)
                          .make(),
                      10.heightBox,
                      "Sit ipsum exercitation tempor nisi non amet. Irure ex reprehenderit do fugiat aliquip sit in cillum ut ea labore minim. Amet velit sit tempor est velit laborum. Nisi et est laboris incididunt sint ea elit ad occaecat."
                          .text
                          .textStyle(context.captionStyle)
                          .color(context.theme.accentColor)
                          .make()
                          .p12(),
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
