import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchNews extends SearchEvent {
  final String query;

  SearchNews(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearchResults extends SearchEvent {}
