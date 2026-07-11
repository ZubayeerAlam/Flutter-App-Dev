import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Model/task_model.dart';

import '../Data/Model/Api_response.dart';
import '../Data/Model/task_model.dart';
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
  Future<void> changeStatus() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.updateTaskStatusURL(
        widget.task.sId.toString(),
        widget.task.status.toString(),
      ),
    );
    if (response.isSuccess) {
      widget.refreshParent();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task status changed successfully')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }

    Navigator.pop(context);

  }

  void showChangeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Status'),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: widget.task.status == 'New' ? Colors.green : null,
              child: ListTile(
                title: Text('New'),
                onTap: () {
                  Navigator.pop(context);
                  changeStatus();
                },
                trailing: widget.task.status == 'New' ? Icon(Icons.check_circle, color: Colors.white):null,
              ),
            ),

            Card(
              color: widget.task.status == 'Progress' ? Colors.green : null,
              child: ListTile(
                title: Text('Progress'),
                onTap: () {
                  Navigator.pop(context);
                  changeStatus();
                },
                trailing:widget.task.status == 'Progress' ? Icon(Icons.check_circle, color: Colors.white): null,

              ),

            ),

            Card(
              color: widget.task.status == 'Completed' ? Colors.green : null,
              child: ListTile(
                title: Text('Completed'),
                onTap: () {
                  Navigator.pop(context);
                  changeStatus();
                },
                trailing: widget.task.status == 'Completed' ? Icon(Icons.check_circle, color: Colors.white) : null,

              ),
            ),
            Card(
              color: widget.task.status == 'Cancelled' ? Colors.green : null,
              child: ListTile(
                title: Text('Cancelled'),
                onTap: () {
                  Navigator.pop(context);
                  changeStatus();
                },
                trailing:widget.task.status == 'Cancelled' ?  Icon(Icons.check_circle, color: Colors.white) : null,

              ),
            ),
          ],
        ),
      ),
    );
  }

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
                backgroundColor: widget.color,
                labelStyle: const TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showChangeDialog();
                },
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
