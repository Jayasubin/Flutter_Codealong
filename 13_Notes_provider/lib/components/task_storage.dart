import 'dart:collection';
import 'package:flutter/foundation.dart';

class TaskStorage extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  int get uncheckedTaskCount {
    int pending = 0;
    for (int count = 0; count < taskCount; count++) {
      if (_tasks[count].isDone != true) {
        pending++;
      }
    }
    return pending;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskName) {
    _tasks.add(Task(taskName: newTaskName));
    notifyListeners();
  }

  void toggleTask(Task currentTask) {
    currentTask.toggleDone();
    notifyListeners();
  }

  void removeTask(Task currentTask) {
    _tasks.remove(currentTask);
    notifyListeners();
  }
}

class Task {
  final String taskName;
  bool isDone;
  Task({required this.taskName, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
