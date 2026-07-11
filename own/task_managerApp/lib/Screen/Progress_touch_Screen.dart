import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Model/Api_response.dart';
import '../Data/Model/task_model.dart';
import '../Data/Model/task_status_count_model.dart';
import '../Data/Service/api_caller.dart';
import '../Utils/Urls.dart';
import '../Widget/taskCard.dart';

class ProgressTouchScreen extends StatefulWidget {
  const ProgressTouchScreen({super.key});

  @override
  State<ProgressTouchScreen> createState() => _State();
}

class _State extends State<ProgressTouchScreen> {
  List<taskModel> taskLists = [];

  Future<void> getAlltask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.getTaskURL("Progress"),
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
  initState(){
    super.initState();
    getAlltask();

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskLists.length,
              itemBuilder: (context, index) {
                return taskCard(
                  task: taskLists[index],
                  color: Colors.purple,
                  refreshParent: () {
                    getAlltask();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );


  }
}
