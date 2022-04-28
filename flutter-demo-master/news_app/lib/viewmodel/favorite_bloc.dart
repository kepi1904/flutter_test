import 'package:bloc/bloc.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/database_handler.dart';

class FavoriteEvent {
  late String id;
  FavoriteEvent({required this.id});
}

class FavoriteState {
  late News news;
  late bool status;

  FavoriteState({required this.news, this.status = false});
}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState);

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    var _news = await DatabaseHandler.findOneNews(event.id);
    if (_news is UninitializedNews) {
      yield FavoriteState(news: UninitializedNews(), status: false);
    } else {
      yield FavoriteState(news: _news, status: true);
    }
  }
}
