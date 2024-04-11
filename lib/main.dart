import 'package:fashion_store/screens/cart.dart';
import 'package:fashion_store/screens/item.dart';
import 'package:fashion_store/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/dashboard.dart';
import 'screens/registration.dart';
import 'screens/splash.dart';
import 'screens/item_detail.dart';
import 'screens/welcome.dart';
import 'utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fashion App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
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
