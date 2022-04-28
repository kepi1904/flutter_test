import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:news_app/viewmodel/news_bloc.dart';
import 'package:news_app/viewmodel/searchbar_bloc.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsBloc bloc = BlocProvider.of<NewsBloc>(context);
    //SearchBarBloc searchBloc = BlocProvider.of<SearchBarBloc>(context);

    // getTitle(bool state) {
    //   if (!state) {
    //     return TextFormField(
    //       style: const TextStyle(color: Colors.white),
    //       decoration: const InputDecoration(
    //         hintText: 'News to search',
    //         hintStyle: TextStyle(
    //           color: Colors.white,
    //           fontSize: 16,
    //           fontStyle: FontStyle.italic,
    //         ),
    //       ),
    //       onFieldSubmitted: (keyword) {
    //         bloc.add(SearchEvent(query: keyword, topic: 'news', reset: true));
    //       },
    //     );
    //   } else {
    //     return const Text('Newss App');
    //   }
    // }

    return SafeArea(
      child: BlocBuilder<SearchBarBloc, bool>(
        builder: (context, searchState) => Scaffold(
          appBar: AppBar(
            title: const Text('News List'), //getTitle(searchState),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       searchBloc.add(!searchState);
            //     },
            //     icon: (searchState)
            //         ? const Icon(Icons.search)
            //         : const Icon(Icons.cancel),
            //   ),
            // ],
          ),
          body: BlocBuilder<NewsBloc, SearchState>(
            builder: (context, state) => StickyFooterScrollView(
              itemCount: state.listNews.length,
              itemBuilder: (context, index) {
                var _news = state.listNews[index];
                return NewsCard(news: _news);
              },
              footer: Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      bloc.add(
                        SearchEvent(
                            page: bloc.state.nextPage,
                            query: bloc.state.query,
                            topic: bloc.state.topic),
                      );
                    },
                    child: const Text(
                      'Load more..',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
