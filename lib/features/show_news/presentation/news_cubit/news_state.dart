part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {
  NewsInitial({required this.news});
  final List<NewsInfo> news;
}

class NewsInitialSearch extends NewsState {
  NewsInitialSearch({required this.news});
  final List<NewsInfo> news;
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {}
