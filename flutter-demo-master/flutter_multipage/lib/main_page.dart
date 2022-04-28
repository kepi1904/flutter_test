import 'package:flutter/material.dart';
import 'package:flutter_multipage/other_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return OtherPage();
              }),
            );
          },
          child: const Text('Goto Other Page'),
        ),
      ),
    );
  }
}
