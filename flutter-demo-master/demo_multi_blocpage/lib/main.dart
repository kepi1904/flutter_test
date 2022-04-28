import 'package:demo_multi_blocpage/bloc/color_bloc.dart';
import 'package:demo_multi_blocpage/bloc/counter_bloc.dart';
import 'package:demo_multi_blocpage/view/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc(Colors.pink)),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc(0)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
      ),
    );
  }
}
