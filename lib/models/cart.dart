import 'package:myfirst_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel
      ._internal(); //making it singelton _internal is a name you can give it any name
  CartModel._internal();

  factory CartModel() => cartModel; //jab b CartModel call ho hamesha yehi cartModel object call ho ta k humara data empty na ho or bar bar initialization na ho
  //catalog fields
  late CatalogModel _catalog; //private so make getter, yahan tak class singelton ban gai

  //collection of Ids - stores ids of each item
  final List<int> _itemIds = [];

//get catalog
  CatalogModel get catalog =>
      _catalog; //we will access _catalog using its getter catalog

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Items in the cart

  List<Item>? get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num? get totalPrice =>
      items?.fold(0, (total, current) => total! + current.price);

  //Add Item

  void add(Item item) {
    _itemIds.add(item.id); //remove is a predefined function
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id); //remove is a predefined function
  }
}
