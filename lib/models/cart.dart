import 'package:myfirst_app/core/store.dart';
import 'package:myfirst_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog fields
  late CatalogModel
      _catalog; //private so make getter, yahan tak class singelton ban gai

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

  
  
}

class AddMutation extends VxMutation<MyStore> {
  @override
  final Item item;

  AddMutation(this.item);
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  @override
  final Item item;

  RemoveMutation(this.item);
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}