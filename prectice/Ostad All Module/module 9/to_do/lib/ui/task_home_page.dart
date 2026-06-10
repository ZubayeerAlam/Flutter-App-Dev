import 'package:flutter/material.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Home Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
        elevation: 0,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                suffixIcon: const Icon(Icons.add),
              ),
              onSubmitted: (value) {
                setState(() {});
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(value: false, onChanged: (_) {}),
                  title: Text("Task-${index+1} "),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete,color: Color(0xFF616161)),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit,color: Color(0xFF616161)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
