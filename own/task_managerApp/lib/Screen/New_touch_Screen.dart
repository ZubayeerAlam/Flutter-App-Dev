import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/task_count_by_status.dart';

class NewTouchScreen extends StatefulWidget {
  const NewTouchScreen({super.key});

  @override
  State<NewTouchScreen> createState() => _NewTouchScreenState();
}

class _NewTouchScreenState extends State<NewTouchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (context, index) {
                return task_count_by_status(count: 10, title: "New");
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "New Task ${index + 1}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Task lkjff afjlkajf afklfa fkjlkdfj flkjfkfjdlkajflkafjlkafdj dkfjlkdjflkajflkajflkafj kdfjlkdfjlkfdjlkjdaflkjfjkjaerfhihkjanfjFHQUEWJLDSNFKJ ",
                    ),
                    Text("Date:23/02/1990"),
                    Row(
                      children: [
                        Chip(label: Text("New Task"),
                          backgroundColor: Colors.blue,
                          labelStyle: TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                          )
                        ),
                        Spacer(),

                        IconButton(onPressed: () {}, icon: Icon(Icons.edit_note, color: Colors.blue,)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red,))

                      ],
                    )
                  ],

                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
