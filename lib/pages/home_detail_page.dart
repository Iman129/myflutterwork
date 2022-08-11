import 'package:flutter/material.dart';
import 'package:myfirst_app/models/catalog.dart';
import 'package:myfirst_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ), //it will give back button
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero, //khali right se padding
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.make(),
              style: ButtonStyle(
                  backgroundColor:
                      // ignore: deprecated_member_use
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image).h40(context).centered())
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
                          .textStyle(context.captionStyle) .color(context.theme.accentColor)
                          .make(),
                      10.heightBox,
                      "Sit ipsum exercitation tempor nisi non amet. Irure ex reprehenderit do fugiat aliquip sit in cillum ut ea labore minim. Amet velit sit tempor est velit laborum. Nisi et est laboris incididunt sint ea elit ad occaecat."
                      .text
                       .textStyle(context.captionStyle).color(context.theme.accentColor)  
                          .make().p12(),
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
