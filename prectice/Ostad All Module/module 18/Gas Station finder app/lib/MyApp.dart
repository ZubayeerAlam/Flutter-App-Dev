import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/homeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Gas Station Finder', home: homeScreen());
  }
}
