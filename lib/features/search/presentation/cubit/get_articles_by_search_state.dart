part of 'get_articles_by_search_cubit.dart';

@immutable
sealed class GetArticlesBySearchState {}

final class GetArticlesBySearchInitial extends GetArticlesBySearchState {}

final class GetArticlesBySearchLoading extends GetArticlesBySearchState {}

final class GetArticlesBySearchSuccess extends GetArticlesBySearchState {
  final List<ArticlesEntity> articles;
  GetArticlesBySearchSuccess({required this.articles});
}

final class GetArticlesBySearchError extends GetArticlesBySearchState {
  final String error;
  GetArticlesBySearchError({required this.error});
}
