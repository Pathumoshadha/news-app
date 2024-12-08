import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/new_model.dart';
import '../Services/services.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi newsApi = NewsApi();

  NewsBloc() : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is SearchNews) {
      yield NewsLoading();
      try {
        await newsApi.searchNews(event.query);
        yield NewsLoaded(articles: newsApi.dataStore);
      } catch (e) {
        yield NewsError(message: e.toString());
      }
    }
  }
}
