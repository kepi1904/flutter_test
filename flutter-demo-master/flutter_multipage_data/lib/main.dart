import 'package:flutter/material.dart';
import 'package:flutter_multipage_data/Todo.dart';
import 'package:flutter_multipage_data/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListPage(
        todos: List.generate(
          20,
          (index) => Todo(
              title: 'Todo $index',
              description: 'Some description for todo $index'),
        ),
      ),
    );
  }
}
