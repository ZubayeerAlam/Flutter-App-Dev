import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class task_count_by_status extends StatelessWidget {
  final int count;
  final String title;

  const task_count_by_status({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              children: [
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(title, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
