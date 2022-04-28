import 'dart:math';

import 'package:demo_mvvm/model/user.dart';
import 'package:demo_mvvm/view/widgets/user_card.dart';
import 'package:demo_mvvm/viewmodel/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.refresh),
        onPressed: () {
          bloc.add(random.nextInt(10) + 1);
        },
      ),
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Demo MVVM'),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<UserBloc, User>(
        builder: (context, user) => (user is UninitializedUser)
            ? Container()
            : UserCard(
                user: user,
              ),
      ),
    );
  }
}
