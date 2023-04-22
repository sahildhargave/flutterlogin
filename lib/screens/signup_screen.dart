import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:shopping/services/firebase_auth_services.dart";

import "../widgets/custom_button.dart";
import "../widgets/custom_textfield.dart";
import "forgot_screen.dart";
import "login_screen.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Hello! Register To Get \n Started",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
          CustomTextfield(
            myController: _usernameController,
            hintText: "Username",
            isPassword: false,
          ),
          CustomTextfield(
            myController: _emailController,
            hintText: "Email",
            isPassword: false,
          ),
          CustomTextfield(
            myController: _passwordController,
            hintText: "Password",
            isPassword: true,
          ),
          CustomTextfield(
            myController: _confirmPasswordController,
            hintText: "Confirm Password",
            isPassword: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text("Forget Password?",
                        style: TextStyle(
                          color: Color(0xFF64B5F6),
                          fontSize: 15,
                        )))),
          ),
          CustomButton(
              buttonText: "Register",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () async {
                try {
                  await FirebaseAuthServices().signup(
                      (_emailController.text).trim(),
                      _passwordController.text.trim());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } on FirebaseException catch (e) {
                  print(e.message);
                }
              }),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.height * 0.12343,
                  color: Colors.grey,
                ),
                const Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Or Register with",
                            style: TextStyle(
                              fontSize: 17,
                            )))),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.height * 0.12439,
                  color: Colors.grey,
                ),
              ])),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook_rounded,
                            color: Colors.blue))),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      // color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.apple,
                      // color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.fromLTRB(48, 8, 8, 8.0),
              child: Row(
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(
                        color: Color(0xff6A707C),
                        fontSize: 15,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Login Now",
                        style: TextStyle(
                          color: Color(0xFF64B5F6),
                          fontSize: 15,
                        )),
                  )
                ],
              )),
          //Row(children: [
          //  Text("Don't have an account?",
          //      style: TextStyle(
          //        color: Color(0xff6A707C),
          //        fontSize: 15,
          //      )),
          //  Text(
          //    "Sign Up",
          //    style: TextStyle(
          //      color: Color(0xff6A707C),
          //      fontSize: 15,
          //    ),
          //  ),
          //])
        ]),
      ),
    )));
  }
}
