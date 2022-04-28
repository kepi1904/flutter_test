import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent { toPink, toGreen, toPurple }

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc(Color initialState) : super(initialState);

  @override
  Color get initialState => Colors.pink;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.toPink)
        ? Colors.pink
        : (event == ColorEvent.toGreen)
            ? Colors.green
            : Colors.purple;
  }
}
