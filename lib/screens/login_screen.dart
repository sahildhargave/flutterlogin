// ignore_for_file: prefer_final_fields

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:shopping/screens/home_screen.dart";
import "package:shopping/screens/signup_screen.dart";
import "package:shopping/widgets/custom_textfield.dart";
import "../screens/forgot_screen.dart";
import "../services/firebase_auth_services.dart";
import "../widgets/custom_button.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: SingleChildScrollView(
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
            child: Text("Welcome Back! Glad \nto see you again",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
          CustomTextfield(
            myController: _emailController,
            hintText: "Enter Your Email",
            isPassword: false,
          ),
          CustomTextfield(
            myController: _passwordController,
            hintText: "Enter Your Password",
            isPassword: true,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: Text("Forget Password?",
                        style: TextStyle(
                          color: Color(0xFF64B5F6),
                          fontSize: 15,
                        ))),
              )),
          CustomButton(
              buttonText: "Login",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () async {
                try {
                  await FirebaseAuthServices().login(
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                  if (FirebaseAuth.instance.currentUser != null) {
                    if (!mounted) return;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                } on FirebaseException catch (e) {
                  debugPrint("error is ${e.message}");
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: Text(
                                  "Invalid Username or password.Please register again or make sure that username and password is correct"),
                              actions: [
                                ElevatedButton(
                                  child: Text(
                                    "Register Now",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                                )
                              ]));
                }

                //Navigator.push(
                //  context,
                //  MaterialPageRoute(
                //    builder: (context) => const LoginScreen(),
                //  ),
                //);
              }),
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.height * 0.13343,
                  color: Colors.grey,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Or Login with",
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
            padding: EdgeInsets.all(10),
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
                        icon:
                            Icon(Icons.facebook_rounded, color: Colors.blue))),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await FirebaseAuthServices().logininwithgoogle();
                      if (FirebaseAuth.instance.currentUser != null) {
                        if (!mounted) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        throw Exception("Error");
                      }
                    },
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
          const SizedBox(height: 120),
          Padding(
              padding: EdgeInsets.fromLTRB(48, 8, 8, 8.0),
              child: Row(
                children: [
                  Text("Don't have an account ?",
                      style: TextStyle(
                        color: Color(0xff6A707C),
                        fontSize: 15,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text("Create Account",
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
