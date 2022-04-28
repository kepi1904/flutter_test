import 'package:flutter/material.dart';
import 'package:flutter_multipage_data/Todo.dart';

class TodoDetailPage extends StatelessWidget {
  TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(todo.description),
      ),
    );
  }
}
