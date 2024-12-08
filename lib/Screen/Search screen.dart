import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../model/new_model.dart';
import '../Services/services.dart';
import 'news detail.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Enter search term...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (query) {
                // Triggering the search event in the Bloc
                context.read<NewsBloc>().add(SearchNews(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final article = state.articles[index];
                      return ListTile(
                        title: Text(article.title ?? 'No Title'),
                        subtitle: Text(article.description ?? 'No Description'),
                        onTap: () {
                          // Navigate to the news detail screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetail(newsModel: article),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is NewsError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("Search for news articles"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
