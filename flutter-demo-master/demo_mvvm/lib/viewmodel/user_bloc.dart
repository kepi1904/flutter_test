import 'package:demo_mvvm/model/user.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc(User initialState) : super(initialState);

  @override
  User get initialState => new UninitializedUser();

  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.loadUser(event);
      yield user;
    } catch (_) {}
  }
}
