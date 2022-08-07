import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  //Item is class in catalog.dart
  @override
  Widget build(BuildContext context) {
    return Card(
      //shape: StadiumBorder(),
      //shadowColor: Colors.blue,
     // color: Colors.blue,
      elevation: 2.10, //card ki outline jo bahir ko kr k feel ho rahi
      child: ListTile(
        onTap: () {
          print("${item.name} is pressed"); // this will be print on our debug console
        },
        //for list item
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        //tileColor: Colors.amber,
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ), // \$$ string interpolation: ta k hum iss ma variable daal saken
      ),
    );
  }
}
