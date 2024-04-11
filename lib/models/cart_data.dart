class CartItemModel {
  late final String imagePath;
  late final String name;
  late final String price;
  CartItemModel(
      {required this.imagePath, required this.name, required this.price});
  static final cartItemList = [
    CartItemModel(
        imagePath: "assets/images/shirts.png",
        name: "Shirt XL",
        price: "LKR 2300.00"),
    CartItemModel(
        imagePath: "assets/images/blouse.png",
        name: "Blouse ",
        price: "LKR 3400.00"),
    CartItemModel(
        imagePath: "assets/images/shorts.png",
        name: "Shorts",
        price: "LKR 2300.00"),
    CartItemModel(
        imagePath: "assets/images/blouse1.png",
        name: "Blouse XL",
        price: "LKR 2500.00"),
  ];
}
