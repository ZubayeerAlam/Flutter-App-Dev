import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/SplashScreen.dart';
import 'Utils/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          hintStyle: TextStyle(
              color: Colors.grey
          ),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

          border: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.P_Color,
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide.none,
            ),
          ),
        ),

        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),

      home: Splashscreen(),
    );
  }
}
