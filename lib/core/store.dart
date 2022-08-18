import 'package:myfirst_app/models/cart.dart';
import 'package:myfirst_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel(); //craeting object
    cart.catalog = catalog;
  }
}
