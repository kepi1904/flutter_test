import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/login_handler.dart';
import 'package:news_app/services/preference_handler.dart';

class LoginEvent {
  late String email;
  late String password;
  late bool isLogout;
  late bool checkPreference;

  LoginEvent(
      {this.email = '',
      this.password = '',
      this.checkPreference = false,
      this.isLogout = false});
}

class LoginState {
  bool isLogged = false;
  bool loginResult = true;
  String token = '';

  LoginState({this.loginResult = true, this.token = '', this.isLogged = false});
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (!event.isLogout) {
      //lakukan proses login
      if (event.checkPreference) {
        String? result = await PreferenceHandler.retrieveToken();
        //check apakah ada token di preferences
        if (result != null) {
          yield LoginState(isLogged: true, loginResult: true);
        } else {
          yield LoginState(isLogged: false, loginResult: true);
        }
      } else {
        String result = await LoginHandler.login(event.email, event.password);
        if (result != 'failed') {
          //save ke preferences
          PreferenceHandler.storingToken(result);
          yield LoginState(isLogged: true, loginResult: true, token: result);
        } else {
          PreferenceHandler.removeToken();
          yield LoginState(isLogged: false, loginResult: false);
        }
      }
    } else {
      //lakuan proses logout
      PreferenceHandler.removeToken();
      yield LoginState(isLogged: false, loginResult: true);
    }
  }
}
