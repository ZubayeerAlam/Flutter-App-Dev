import 'package:flutter/material.dart';

import '../DB/task_database.dart';
import '../model/task_model.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}


class _TaskHomePageState extends State<TaskHomePage> {

  List<Task> tasks = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState()  {
    super.initState();
    refreshTask();
  }

  Future<void>refreshTask()async {
    tasks =  await TaskDatabase().getTasks();
    setState(() {});
  }

  Future<void> addTask() async {
    if(textEditingController.text.isNotEmpty){
      final newTask = Task(title: textEditingController.text, isDone: false);
      await TaskDatabase().insertDB(newTask);
      textEditingController.clear();
      refreshTask();
    }
    else{
      print('Please enter a task');
    }
  }

  Future<void> deleteTask(Task task) async {
    await TaskDatabase().deleteTask(task.id!);
    refreshTask();
  }

  Future<void> updateTask(Task task) async {
    await TaskDatabase().updateTask(task);
    refreshTask();
  }

  Future<void> toggleTask(Task task) async {
    // task.isDone = !task.isDone;
    // await TaskDatabase().updateTask(task);
    await TaskDatabase().updateTask(Task(id: task.id, title: task.title, isDone: !task.isDone));
    refreshTask();
  }

  Future<void> editTask(Task task) async {
    TextEditingController editController = TextEditingController(text: task.title);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(hintText: 'Enter new task title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                )),

          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (editController.text.isNotEmpty) {
                  await TaskDatabase().updateTask(Task(id: task.id, title: editController.text, isDone: task.isDone));
                  refreshTask();
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }


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
            padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add Task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  ),
                ),

                // const SizedBox(width: 16),
                IconButton(onPressed:(){
                  addTask();
                }, icon: const Icon(Icons.add),),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(value: tasks[index].isDone, onChanged: (_) {
                    toggleTask(tasks[index]);
                  }),
                  title: Text(tasks[index].title),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          deleteTask(tasks[index]);
                        },
                        icon: const Icon(Icons.delete,color: Color(0xFF616161)),
                      ),

                      IconButton(
                        onPressed: () {
                          // updateTask(tasks[index]);
                          editTask(tasks[index]);
                        },
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
