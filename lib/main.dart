import 'package:store/screens/cart.dart';
import 'package:store/screens/item.dart';
import 'package:store/screens/login.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/registration.dart';
import 'screens/splash.dart';
import 'screens/item_detail.dart';
import 'screens/welcome.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fashion App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        MyRoutes.welcomeRoute: (context) => const WelcomeScreen(),
        MyRoutes.registrationRoute: (context) => RegistrationScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.dashboardRoute: (context) => const DashboardScreen(),
        MyRoutes.itemRoute: (context) => const ItemScreen(),
        MyRoutes.itemDetailRoute: (context) => const ItemDetailScreen(),
        MyRoutes.cartRoute: (context) => const CartScreen(),
      },
    );
  }
}
