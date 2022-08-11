import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/themes.dart';



class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //text left se start hoga
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkbluishColor).make(),
        "Trending products".text.xl2.make(), //same as text() widget
        
      ],
    );
  }
}