// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//import 'dart:convert';

class CatalogModel {
   static final catModel = CatalogModel
      ._internal(); //making it singelton _internal is a name you can give it any name
  CatalogModel._internal();

  factory CatalogModel() => catModel; //jab b CartModel call ho hamesha yehi cartModel object call ho ta k humara data empty na ho or bar bar initialization na ho
  
  //catalog fields

 
  // static to acces directly
  static List<Item> items = [];

   Item getById(int id) => items.firstWhere((element) => element.id == id,
      orElse: null); //lement ki id meri id k equal honi chahiye warna null ho

  //get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id; //can not be changed if final
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source));
     // static Map arguments = (Item.arguments??{}) as Map;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
