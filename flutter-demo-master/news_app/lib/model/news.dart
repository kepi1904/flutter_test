import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/config/const.dart';

class News {
  late String id;
  late String title;
  late String author;
  late String published_date;
  late String link;
  late String excerpt;
  late String summary;
  late String media;
  late String clean_url;

  News({
    this.id = '',
    this.author = '',
    this.title = '',
    this.published_date = '',
    this.link = '',
    this.excerpt = '',
    this.summary = '',
    this.media = '',
    this.clean_url = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'published_date': published_date,
      'link': link,
      'excerpt': excerpt,
      'summary': summary,
      'media': media,
      'clean_url': clean_url
    };
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["_id"] != null ? json["_id"].toString() : json["id"].toString(),
      title: json['title'].toString(),
      author: (json['author'] == null) ? 'Unknown' : json['author'].toString(),
      published_date: json['published_date'].toString(),
      link: json['link'].toString(),
      excerpt: json['excerpt'].toString(),
      summary: json['summary'].toString(),
      media: (json['media'] == null)
          ? 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png'
          : json['media'].toString(),
      clean_url: json['clean_url'].toString(),
    );
  }

  static Future<List<News>> findAllNews(
      int page, String q, String topic) async {
    final url = Uri.parse(
        'https://api.newscatcherapi.com/v2/search?q=$q&topic=$topic&page_size=10&page=$page');
    final response = await http.get(url, headers: Const.headers);
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var listNews = jsonBody['articles'];
      List<News> allNews = [];
      for (var news in listNews) {
        allNews.add(News.fromJson(news));
      }
      return allNews;
    } else {
      throw Exception('Failed to load News');
    }
  }
}

class UninitializedNews extends News {}
