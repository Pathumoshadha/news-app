import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/services.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsApi newsApi;

  SearchBloc(this.newsApi) : super(SearchInitial()) {
    on<SearchNews>((event, emit) async {
      emit(SearchLoading());
      try {
        final articles = await newsApi.searchNews(event.query);
        emit(SearchLoaded(articles));
      } catch (e) {
        emit(SearchError("Failed to fetch search results."));
      }
    });

    on<ClearSearchResults>((event, emit) {
      emit(SearchInitial());
    });
  }
}
