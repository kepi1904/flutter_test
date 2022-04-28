import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  late Color color;

  ColorBloc(Color initialState) : super(initialState) {
    color = initialState;
  }

  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    color = (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;
    yield color;
  }
}
