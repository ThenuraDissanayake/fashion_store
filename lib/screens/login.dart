import 'package:fashion_store/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../widgets/text_input_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController eMail = TextEditingController();
  final TextEditingController passWord = TextEditingController();

  void _signIn(BuildContext context) async {
    String email = eMail.text;
    String password = passWord.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username or password is missing'),
        ),
      );
      return;
    }

    User? user = await _auth.signin(email, password);

    if (user != null) {
      print("User SignIn Successfully Created");
      Navigator.pushNamed(context, MyRoutes.dashboardRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username or password is wrong'),
        ),
      );
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
                        "Log in here",
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
                      hint: "Email Address",
                      textEditingController: eMail,
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
                            _signIn(context);                    },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xffd91e1e),
                        ),
                        child: const Text("Login",
                            style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.registrationRoute);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "Don't you have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA9A9AA),
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Register Now",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5D5FEF))),
                            ],
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
