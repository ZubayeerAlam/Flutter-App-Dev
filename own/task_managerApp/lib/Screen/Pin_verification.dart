import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Utils/app_color.dart';

import '../Widget/Pin_Verification_Box.dart';
import '../Widget/ScreenBG.dart';
import 'Set_Password_Screen.dart';
import 'login_screen.dart';

class Pin_verification_Screen extends StatefulWidget {
  const Pin_verification_Screen({super.key});

  @override
  State<Pin_verification_Screen> createState() => _Pin_verification_ScreenState();
}

class _Pin_verification_ScreenState extends State<Pin_verification_Screen> {
  void onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Set_password()));
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
                  SizedBox(height: 280),
                  Text(
                    "PIN Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "A 6 digit verification code will be sent to your email address",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),

                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Pin_Box(),
                      Pin_Box(),
                      Pin_Box(),
                      Pin_Box(),
                      Pin_Box(),
                      Pin_Box(),
                    ],
                  ),
                  SizedBox(height: 12),

                 FilledButton(onPressed: () {}, child: Text("Verify")),
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
