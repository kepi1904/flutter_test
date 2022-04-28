import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/view/pages/bookmark_page.dart';
import 'package:news_app/view/pages/news_page.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:news_app/viewmodel/login_bloc.dart';
import 'package:news_app/viewmodel/news_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  topWidget(bloc, loginBloc, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("images/user.jpeg"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Hi, HCR Member',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  bloc.add(SearchEvent(reset: true));
                  loginBloc.add(LoginEvent(isLogout: true));
                },
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Search news",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            onFieldSubmitted: (keyword) {
              bloc.add(SearchEvent(query: keyword, topic: 'news', reset: true));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const NewsPage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  gridItem(icon, title, newsBloc, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CircleAvatar(
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightBlue,
            radius: 25,
          ),
          onTap: () {
            if (title != 'Bookmark') {
              newsBloc.add(
                SearchEvent(
                    query: '*', topic: title.toLowerCase(), reset: true),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const NewsPage();
                }),
              );
            } else {
              //show halaman bookmark
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const BookmarkPage();
                }),
              );
            }
          },
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  latestNews(headlines) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(), // kebutuhan nested liest
        shrinkWrap: true, // kebutuhan nested liest
        itemCount: headlines.length,
        itemBuilder: (context, index) {
          var _news = headlines[index];
          return NewsCard(news: _news);
        });
  }

  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 255, 255, 255),
      body: ListView(
        children: <Widget>[
          topWidget(newsBloc, loginBloc, context),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Topics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 190,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
              ),
              children: <Widget>[
                gridItem(
                    FontAwesomeIcons.earthAmericas, "World", newsBloc, context),
                gridItem(FontAwesomeIcons.microchip, "Tech", newsBloc, context),
                gridItem(
                    FontAwesomeIcons.moneyBill, "Finance", newsBloc, context),
                gridItem(
                    FontAwesomeIcons.landmark, "Politics", newsBloc, context),
                gridItem(FontAwesomeIcons.map, "Travel", newsBloc, context),
                gridItem(Icons.favorite, "Bookmark", newsBloc, context),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Headlines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          BlocBuilder<NewsBloc, SearchState>(
            builder: (context, state) => Container(
              child: latestNews(state.listNews.take(5).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
