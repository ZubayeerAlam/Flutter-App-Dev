import 'package:flutter/material.dart';
import 'package:to_do/Module10/class1.dart';
import 'Module9/ui/task_home_page.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const TaskHomePage(),

      home: const module10(),
    );
  }
}
