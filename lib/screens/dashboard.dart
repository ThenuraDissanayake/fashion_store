import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_store/utils/routes.dart';
import '../widgets/cart_badge.dart';
import '../widgets/item_card.dart';
import 'cart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/user.png",
                    scale: 3.6,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey",
                            style: TextStyle(
                                color: Color(0xff979899),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "User",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CartScreen()), // Navigate to the cart screen
                        );
                      },
                      child: const CartIconWithBadge(itemCount: 0),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF3F5F7),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Category",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff979899),
                          fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Color(0xff23AA49),
                      ),
                    )),
              )),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Image.asset(
          //     "assets/images/banner.jpg",
          //     scale: 4.0,
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _seeAllView(context, "Categories"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    _categoriesView("assets/images/jeans.png", "Jeans"),
                    _categoriesView("assets/images/shorts.png", "Shorts"),
                    _categoriesView("assets/images/blouse.png", "Blouse"),
                    _categoriesView("assets/images/shirts.png", "Shirt")
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                _seeAllView(context, "Best Selling"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ItemCardWidget(
                        imagePath: "assets/images/blouse1.png",
                        name: "Blouse XL",
                        price: "LKR 2300.00",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.itemDetailRoute);
                        },
                      ),
                    ),
                    Expanded(
                      child: ItemCardWidget(
                        imagePath: "assets/images/jeans.png",
                        name: "Jeans XL",
                        price: "LKR 2300.00",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.itemDetailRoute);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ItemCardWidget(
                        imagePath: "assets/images/shirts.png",
                        name: "Shirt XL",
                        price: "LKR 4300.00",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.itemDetailRoute);
                        },
                      ),
                    ),
                    Expanded(
                      child: ItemCardWidget(
                        imagePath: "assets/images/blouse.png",
                        name: "Blouse XL",
                        price: "LKR 2300.00",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.itemDetailRoute);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _seeAllView(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.itemRoute);
          },
          child: const Text(
            "See All",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff23AA49),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _categoriesView(String imagePath, String catName) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffF3F5F7),
            radius: 32,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                scale: 1.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            catName,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          )
        ],
      ),
    );
  }
}
