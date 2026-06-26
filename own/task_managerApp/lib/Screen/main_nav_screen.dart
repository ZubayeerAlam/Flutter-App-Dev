import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Utils/app_color.dart';

import '../Widget/Appbar_widget.dart';
import 'Cenceled_touch_screen.dart';
import 'Completed_touch_Screen.dart';
import 'New_touch_Screen.dart';
import 'Progress_touch_Screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;
  List Screens = [
    NewTouchScreen(),
    ProgressTouchScreen(),
    CompletedTouchScreen(),
    CenceledTouchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_Widget(),

      body: Screens[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          selectedIndex = index;

          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.task), label: "New Task"),
          NavigationDestination(icon: Icon(Icons.refresh), label: "Progress"),
          NavigationDestination(
            icon: Icon(Icons.task_alt_outlined),
            label: "Completed",
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: "Cenceled",
          ),
        ],
      ),
    );
  }
}

