import 'package:flutter/material.dart';
import 'package:flutter_multipage/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return MainPage();
              }),
            );
          },
          child: const Text('Signin'),
        ),
      ),
    );
  }
}
