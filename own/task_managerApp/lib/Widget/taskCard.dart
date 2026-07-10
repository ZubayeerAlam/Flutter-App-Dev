import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Model/task_model.dart';

import '../Data/Model/Api_response.dart';
import '../Data/Service/api_caller.dart';
import '../Utils/Urls.dart';

class taskCard extends StatefulWidget {
  final taskModel task;
  final Color color;
  final VoidCallback refreshParent;
  const taskCard({
    super.key,
    required this.task,
    required this.color,
    required this.refreshParent,
  });

  @override
  State<taskCard> createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  Future<void> deleteTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.deleteTaskURL(widget.task.sId.toString()),
    );
    if (response.isSuccess) {
      widget.refreshParent();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task deleted successfully')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.title.toString(),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.task.description.toString()),
          Text(widget.task.createdDate.toString()),
          Row(
            children: [
              Chip(
                label: Text(widget.task.title.toString()),
                backgroundColor: Colors.blue,
                labelStyle: const TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_note, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  deleteTask();
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
