import 'package:flutter/material.dart';
import 'constants.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {required this.taskTitle,
      required this.isDone,
      required this.onToggle,
      required this.onLongPressed});

  final String taskTitle;
  final bool isDone;
  final Function onToggle;
  final Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: isDone ? kCompletedTaskStyle : kPendingTaskStyle,
      ),
      trailing: Checkbox(
        value: isDone,
        activeColor: kMainColor,
        checkColor: kLineColor,
        onChanged: (bool? dummy) {
          onToggle();
        },
      ),
      onLongPress: () {
        onLongPressed();
      },
    );
  }
}
