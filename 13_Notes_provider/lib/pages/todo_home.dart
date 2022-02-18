import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/components/task_list.dart';
import 'package:state_management/components/constants.dart';
import 'package:state_management/components/task_storage.dart';
import 'package:state_management/pages/add_task_sheet.dart';
import 'package:provider/provider.dart';

class TodoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const CircleAvatar(
                    backgroundColor: kAccentColor,
                    radius: 30,
                    child: Icon(
                      Icons.list_rounded,
                      size: 34,
                      color: kLineColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      const Text(
                        'My To-Do',
                        style: TextStyle(
                          color: kLineColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        Provider.of<TaskStorage>(context).uncheckedTaskCount !=
                                0
                            ? '${Provider.of<TaskStorage>(context).uncheckedTaskCount} remaining'
                            : '',
                        style: const TextStyle(
                          color: kLineColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Provider.of<TaskStorage>(context).taskCount != 0
                      ? TaskList()
                      : Center(
                          child: Text(
                            'Press the add button on the bottom\nto create a new task,\n\nLong press on a task to remove it.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 34,
          color: kLineColor,
        ),
        backgroundColor: kMainColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskSheet(),
          );
        },
      ),
    );
  }
}
