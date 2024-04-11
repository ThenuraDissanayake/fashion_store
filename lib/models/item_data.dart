class ItemModel {
  late final String imagePath;
  late final String name;
  late final String price;
  ItemModel({required this.imagePath, required this.name, required this.price});
  static final getItemList = [
    ItemModel(
        imagePath: "assets/images/shirts.png",
        name: "Shirt XL",
        price: "LKR 2300.00"),
    ItemModel(
        imagePath: "assets/images/blouse.png",
        name: "Blouse ",
        price: "LKR 3400.00"),
    ItemModel(
        imagePath: "assets/images/shorts.png",
        name: "Shorts",
        price: "LKR 2300.00"),
    ItemModel(
        imagePath: "assets/images/blouse1.png",
        name: "Blouse XL",
        price: "LKR 2500.00"),
    ItemModel(
        imagePath: "assets/images/shirts.png",
        name: "Shirt XL",
        price: "LKR 2300.00"),
    ItemModel(
        imagePath: "assets/images/blouse.png",
        name: "Blouse ",
        price: "LKR 3400.00"),
    ItemModel(
        imagePath: "assets/images/shorts.png",
        name: "Shorts",
        price: "LKR 2300.00"),
    ItemModel(
        imagePath: "assets/images/blouse1.png",
        name: "Blouse XL",
        price: "LKR 2500.00"),
  ];
}
