import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/Data/Service/api_caller.dart';
import 'package:task_manager/Widget/ScreenBG.dart';

import '../Data/Model/Api_response.dart';
import '../Data/Model/task_model.dart';
import '../Utils/Urls.dart';
import 'main_nav_screen.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
   Future<void> createTask() async {
     final ApiResponse response=  await ApiCaller.postRequest(
      url: Urls.CreateTaskURL,
      body: {"title": titleController.text, "description": descriptionController.text, "status": "New"},
    );

    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task added successfully')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 222),

              Text(
                "Add new task",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 28),

              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Task Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 12),
              TextFormField(
                controller: descriptionController,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: "Task Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 12),

              FilledButton(
                onPressed: () {
                  createTask();
                },
                child: Icon(Icons.arrow_circle_right_outlined, size: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
