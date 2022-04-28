import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  final textController = TextEditingController();

  addTodo() {
    setState(() {
      widgets.add(
        Text(textController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Form(
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                            hintText: 'New Todo',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: addTodo,
                        child: const Text('Add Todo'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: widgets,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
