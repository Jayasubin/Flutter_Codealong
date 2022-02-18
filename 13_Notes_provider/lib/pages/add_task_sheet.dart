import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/components/constants.dart';
import 'package:state_management/components/my_button.dart';
import 'package:state_management/components/task_storage.dart';

class AddTaskSheet extends StatelessWidget {
  String newTaskName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkenedAccent,
      child: Container(
        decoration: const BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Text(
                  'Add Task',
                  style: kPendingTaskStyle.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (typedData) {
                    newTaskName = typedData;
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                    label: Text('Task'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.playlist_add_check,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      label: 'Discard',
                      onClick: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    MyButton(
                      label: 'Add task',
                      onClick: () {
                        Provider.of<TaskStorage>(context, listen: false)
                            .addTask(newTaskName);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
