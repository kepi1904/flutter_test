import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter'),
          backgroundColor: Colors.green[700],
        ),
        body: Container(
          width: 400,
          height: 200,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red, Colors.green],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
              'Hello, welcome to demo Text! happy coding!! semoga cepat bisa flutter',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
