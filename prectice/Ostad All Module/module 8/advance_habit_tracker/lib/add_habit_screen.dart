import 'package:flutter/material.dart';

class AddHabitScreen extends StatelessWidget {
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Habit'),
      ),
      body: Center(
        child: Text('Add Habit Screen'),
      ),
    );
  }
}
