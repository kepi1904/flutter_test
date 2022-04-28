import 'package:demo_multi_blocpage/bloc/color_bloc.dart';
import 'package:demo_multi_blocpage/bloc/counter_bloc.dart';
import 'package:demo_multi_blocpage/view/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => TemplatePage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () {
                    counterBloc.add(number + 1);
                  },
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPink);
                    },
                    child: const Text('Pink'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toGreen);
                    },
                    child: const Text('Green'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPurple);
                    },
                    child: const Text('Purple'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
