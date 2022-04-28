import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/database_handler.dart';
import 'package:news_app/viewmodel/favorite_bloc.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) =>
          FavoriteBloc(FavoriteState(news: UninitializedNews()))
            ..add(FavoriteEvent(id: news.id)),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(news.title),
            actions: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) => IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: (state.status) ? Colors.pink : Colors.white,
                  ),
                  onPressed: () {
                    FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);
                    bloc.add(FavoriteEvent(id: news.id));
                    if (state.status) {
                      //trigger event hapus
                      DatabaseHandler.deleteNews(news.id).then((value) {
                        const snackBar = SnackBar(
                          content: Text('Removed News from your favorites'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    } else {
                      //trigger event save
                      DatabaseHandler.insertNews(news).then((value) {
                        const snackBar = SnackBar(
                          content: Text('Saved News to your favorites'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(news.media),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  news.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  news.published_date + " | " + news.clean_url,
                  style: const TextStyle(fontSize: 10),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(news.summary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
