import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/assets_path.dart';
import '../Widget/ScreenBG.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';
import 'main_nav_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MoveToNextScreen();
    });
  }


  Future<void> MoveToNextScreen() async {
    Future.delayed(Duration(seconds: 5));
    await AuthController.getUserData();
    bool isLogin = await AuthController.isLoggedIn();
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Image.asset(AssetsPath.logoPNG, width: 200, height: 200),
      ),
    );
  }
}
