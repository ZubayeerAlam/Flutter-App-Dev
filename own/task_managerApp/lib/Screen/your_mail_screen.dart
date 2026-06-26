import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Utils/app_color.dart';

import '../Widget/ScreenBG.dart';
import 'Pin_verification.dart';
import 'login_screen.dart';

class Mail_Screen extends StatefulWidget {
  const Mail_Screen({super.key});

  @override
  State<Mail_Screen> createState() => _Mail_ScreenState();
}

class _Mail_ScreenState extends State<Mail_Screen> {
  void onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pin_verification_Screen()));
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
                  SizedBox(height: 250),
                  Text(
                    "Your Email Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "A 6 digit verification code will be sent to your email address",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),

                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
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
