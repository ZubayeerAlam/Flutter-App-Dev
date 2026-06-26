import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Utils/app_color.dart';

import '../Widget/ScreenBG.dart';
import 'Pin_verification.dart';
import 'login_screen.dart';

class Set_password extends StatefulWidget {
  const Set_password({super.key});

  @override
  State<Set_password> createState() => _Set_passwordState();
}

class _Set_passwordState extends State<Set_password> {
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
                  SizedBox(height: 242),
                  Text(
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Minimum length of password is 8 characters with Latter and Number combination",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),

                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "New Password",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),

                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Old Password",
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
                          style: TextStyle(
                            color: AppColors.P_Color,
                            fontWeight: FontWeight.bold,
                          ),
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
