import 'package:flutter/material.dart';
import 'package:state_management/components/task_storage.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStorage>(
      builder: (context, taskStorage, child) {
        return ListView.builder(
          itemCount: taskStorage.taskCount,
          //Provider.of<TaskStorage>(context).tasks[index].length,
          itemBuilder: (context, index) {
            final currentTask = taskStorage.tasks[index];
            return TaskTile(
              taskTitle: currentTask.taskName,
              isDone: currentTask.isDone,
              onToggle: () {
                taskStorage.toggleTask(currentTask);
              },
              onLongPressed: () {
                taskStorage.removeTask(currentTask);
              },
            );
          },
        );
      },
    );
  }
}
