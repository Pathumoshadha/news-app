import '../model/new_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> articles;

  NewsLoaded({required this.articles});
}

class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}
