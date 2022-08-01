class Items {
  final String id; //can not be changed if final
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
  final products=[Items(
    id:"Iman129",
    name:"iPhone 12pro Max",
    desc:"Aplle iPhone 12th Gen",
    price:1200000,
    color:"black",
    image:"https://cdn.shopify.com/s/files/1/0282/8510/8356/products/IPHONE12proMAX-Gold-black_2000x2000.png?v=1608469739",
    )];
}
