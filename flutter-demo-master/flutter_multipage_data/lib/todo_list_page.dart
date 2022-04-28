import 'package:flutter/material.dart';
import 'package:flutter_multipage_data/Todo.dart';
import 'package:flutter_multipage_data/todo_detail_page.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key, required this.todos}) : super(key: key);

  List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TodoDetailPage(todo: todos[index]);
                }),
              );
            },
          );
        },
      ),
    );
  }
}
