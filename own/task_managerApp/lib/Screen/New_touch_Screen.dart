import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager/Data/Model/task_model.dart';
import '../Data/Model/Api_response.dart';
import '../Data/Model/task_status_count_model.dart';
import '../Data/Service/api_caller.dart';
import '../Utils/Urls.dart';
import '../Widget/taskCard.dart';
import '../Widget/task_count_by_status.dart';
import 'add_new_task_screen.dart';

class NewTouchScreen extends StatefulWidget {
  const NewTouchScreen({super.key});

  @override
  State<NewTouchScreen> createState() => _NewTouchScreenState();
}

class _NewTouchScreenState extends State<NewTouchScreen> {
  @override
  void initState() {
    super.initState();
    getTaskCount();
    getAlltask();
  }

  List<taskModel> taskLists = [];

  Future<void> getAlltask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.getTaskURL("New"),
    );
    List<taskModel> taskList = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsondata in response.responseData['data']) {
        taskList.add(taskModel.fromJson(jsondata));
      }
      print(response.responseData['data']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonDecode(response.responseData['data']))),
      );
    }

    setState(() {
      taskLists = taskList;
    });
  }

  List<TaskStatusCountModel> taskCount = [];

  Future<void> getTaskCount() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.getTaskCountURL,
    );
    List<TaskStatusCountModel> taskC = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        taskC.add(TaskStatusCountModel.fromJson(jsonData));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData['status'].toString())),
      );
    }

    // taskC.removeWhere((element) => element.sId == null);
    //
    // final statusOrder = ['New', 'Progress', 'Completed', 'Cancelled'];
    // taskC.sort((a, b) => statusOrder.indexOf(a.sId!).compareTo(statusOrder.indexOf(b.sId!)));

    setState(() {
      taskCount = taskC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskCount.length,
                itemBuilder: (context, index) {
                  final statusOrder = [
                    'New',
                    'Progress',
                    'Completed',
                    'Cancelled',
                  ];
                  final task = taskCount.firstWhere(
                    (s) => s.sId == statusOrder[index],
                    orElse: () =>
                        TaskStatusCountModel(sId: statusOrder[index], sum: 0),
                  );

                  return task_count_by_status(
                    count: task.sum!.toInt(),
                    title: task.sId.toString(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskLists.length,
              itemBuilder: (context, index) {
                return taskCard(
                  task: taskLists[index],
                  color: Colors.blue,
                  refreshParent: () {
                    getAlltask();
                    getTaskCount();
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
