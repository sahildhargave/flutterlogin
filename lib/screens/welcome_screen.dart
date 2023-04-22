import 'package:flutter/material.dart';
import 'package:shopping/screens/signup_screen.dart';

import '../widgets/custom_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 130,
                  width: 180,
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 60),
                CustomButton(
                    buttonText: "Login",
                    buttonColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }),
                CustomButton(
                  buttonText: "Register",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                    padding: EdgeInsets.all(9),
                    child: Text("Continue as a Guest",
                        style:
                            TextStyle(color: Color(0xff35c2c1), fontSize: 15)))
              ],
            )));
  }
}
