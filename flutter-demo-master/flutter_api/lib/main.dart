import 'package:flutter/material.dart';
import 'package:flutter_api/account_model.dart';
import 'package:flutter_api/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User user = new User();
  Account account = new Account();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo API'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Response from API : '),
              // Text(user != null
              //     ? user.id.toString() +
              //         " | " +
              //         user.firstName +
              //         " | " +
              //         user.lastName
              //     : 'No response'),
              Text(account != null
                  ? account.id + " | " + account.name + " | " + account.job
                  : 'No response'),
              ElevatedButton(
                onPressed: () {
                  // User.findById(2).then((data) {
                  //   user = data;
                  //   setState(() {});
                  // });
                  Account.createAccount('Hendro', 'Programmer').then((data) {
                    account = data;
                    setState(() {});
                  });
                },
                child: const Text('Call API'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
