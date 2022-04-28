import 'package:demo_mvvm/view/pages/main_page.dart';
import 'package:demo_mvvm/viewmodel/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<UserBloc>(
          create: (context) => UserBloc(
                UninitializedUser(),
              ),
          child: MainPage()),
    );
  }
}
