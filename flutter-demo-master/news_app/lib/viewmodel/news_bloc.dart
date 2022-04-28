import 'package:bloc/bloc.dart';
import 'package:news_app/model/news.dart';

class SearchEvent {
  late String query;
  late String topic;
  late int page;
  late bool reset;

  SearchEvent(
      {this.query = 'Indonesia',
      this.topic = 'news',
      this.page = 1,
      this.reset = false});
}

class SearchState {
  List<News> listNews = [];
  int nextPage = 1;
  String query = '';
  String topic = '';
  bool reset = false;

  SearchState(
      {required this.listNews,
      this.nextPage = 1,
      this.reset = false,
      this.query = '',
      this.topic = ''});
}

class NewsBloc extends Bloc<SearchEvent, SearchState> {
  NewsBloc(SearchState initialState) : super(initialState);

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    final List<News> _listNews = state.listNews;

    List<News> moreNews =
        await News.findAllNews(event.page, event.query, event.topic);

    if (event.reset) {
      _listNews.clear();
    }
    _listNews.addAll(moreNews);

    yield SearchState(
        listNews: _listNews,
        nextPage: event.page + 1,
        query: event.query,
        topic: event.topic);
  }
}
