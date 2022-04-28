import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/database_handler.dart';
import 'package:news_app/view/widgets/news_card.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<News> listNews = [];

  @override
  void initState() {
    super.initState();
    getBookmarkNews();
  }

  getBookmarkNews() async {
    listNews = await DatabaseHandler.retrieveNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookmark'),
          actions: [
            IconButton(
              onPressed: () {
                getBookmarkNews();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listNews.length,
          itemBuilder: (context, index) {
            var _news = listNews[index];
            return NewsCard(news: _news);
          },
        ),
      ),
    );
  }
}
