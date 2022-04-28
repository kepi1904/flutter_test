import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/pages/home_page.dart';
import 'package:news_app/view/pages/login_page.dart';
import 'package:news_app/viewmodel/login_bloc.dart';
import 'package:news_app/viewmodel/news_bloc.dart';
import 'package:news_app/viewmodel/searchbar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) =>
              NewsBloc(SearchState(listNews: []))..add(SearchEvent()),
        ),
        BlocProvider<SearchBarBloc>(
          create: (context) => SearchBarBloc(true),
        ),
        BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(LoginState())..add(LoginEvent(checkPreference: true)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, login) {
            if (login.isLogged) {
              return const HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
