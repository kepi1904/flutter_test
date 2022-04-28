import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarBloc extends Bloc<bool, bool> {
  SearchBarBloc(bool initialState) : super(initialState);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
