import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/pages/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 180,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewsDetailPage(news: news);
              }),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(news.media),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news.title),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(news.published_date),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
