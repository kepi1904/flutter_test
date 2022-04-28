import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage(
      {Key? key, this.backgroundColor = Colors.pink, required this.body})
      : super(key: key);

  final Color backgroundColor;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Demo Multi Bloc And Page'),
      ),
      body: body,
    );
  }
}
