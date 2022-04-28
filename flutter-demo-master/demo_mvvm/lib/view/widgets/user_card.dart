import 'package:demo_mvvm/model/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(user.avatar),
              ),
            ),
          ),
          Text(
            user.firstName + ' ' + user.lastName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            user.email,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
