import 'package:flutter/material.dart';
import 'package:flutter_demo_paging/user_model.dart';

class UserDetailPage extends StatelessWidget {
  UserDetailPage({Key? key, required this.userInfo}) : super(key: key);

  late User userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(userInfo.firstName + " " + userInfo.lastName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(userInfo.avatar),
                ),
              ),
            ),
            Text(
              userInfo.firstName + " " + userInfo.lastName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              userInfo.email,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
