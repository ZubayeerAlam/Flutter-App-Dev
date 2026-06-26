import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Utils/app_color.dart';

import '../Widget/ScreenBG.dart';
import 'login_screen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  void onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 180),
                  Text(
                    "Join With Us",
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
                      hintText: "First Name",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
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
                      onPressed: () {},
                      child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 35),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(color: AppColors.P_Color, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
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
