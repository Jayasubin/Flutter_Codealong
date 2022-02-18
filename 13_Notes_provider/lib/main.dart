import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/components/task_storage.dart';
import '/pages/todo_home.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskStorage(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoHome(),
      ),
    );
  }
}
