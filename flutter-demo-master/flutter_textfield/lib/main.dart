import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late String statement;
  final myTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Textfield'),
        ),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: myTextController,
                  decoration: const InputDecoration(
                    hintText: 'Add Statement',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(myTextController.text);
                },
                child: const Text('Saved'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
