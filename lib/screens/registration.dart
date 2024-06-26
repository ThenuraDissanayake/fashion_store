import 'package:fashion_store/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/routes.dart';
import '../widgets/text_input_widget.dart';
import 'dart:convert';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController userName = TextEditingController();
  final TextEditingController eMail = TextEditingController();
  final TextEditingController passWord = TextEditingController();

  void _signUp(BuildContext context) async {
    String username = userName.text;
    String email = eMail.text;
    String password = passWord.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    User? user = await _auth.signup(email, password);

    if (user != null) {
      print("User is Successfully Created");
      Navigator.pushNamed(context, MyRoutes.dashboardRoute);
    } else {
      print("Some Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            "assets/images/back_icon.png",
            scale: 2.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xffffffff),
                      radius: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/app_logo.jpg",
                          scale: 4.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        "Register Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      child: const Text(
                        "We will send you a verification code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff979899)),
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    TextInputWidget(
                      type: TextInputType.text,
                      hint: "Email",
                      textEditingController: eMail,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInputWidget(
                      type: TextInputType.text,
                      hint: "Name",
                      textEditingController: userName,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInputWidget(
                      type: TextInputType.visiblePassword,
                      hint: "Password",
                      textEditingController: passWord,
                      obscureText: true,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          _signUp(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xffd91e1e),
                        ),
                        child: const Text("Register",
                            style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "Back to login ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA9A9AA),
                                fontSize: 12),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
