import 'package:flutter/material.dart';
import 'package:task_manager/Screen/sign_up_screen.dart';
import 'package:task_manager/Screen/your_mail_screen.dart';
import '../Screen/main_nav_screen.dart';

import '../Utils/app_color.dart';
import '../Widget/ScreenBG.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>signUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 250),
                  Text(
                    "Get started with ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),

                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),

                  SizedBox(height: 8),

                  SizedBox(
                    // width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
                      },
                      child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 35),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mail_Screen()));

                  }, child: Text("Forgot Password?")),

                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      // recognizer: TapGestureRecognizer()..onTap = onTapSignUp,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(color:AppColors.P_Color, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = onTapSignUp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
