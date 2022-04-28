import 'package:demo_multi_blocpage/bloc/color_bloc.dart';
import 'package:demo_multi_blocpage/bloc/counter_bloc.dart';
import 'package:demo_multi_blocpage/view/second_page.dart';
import 'package:demo_multi_blocpage/view/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => TemplatePage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text('Ganti Warna'),
                style: ElevatedButton.styleFrom(
                  primary: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
