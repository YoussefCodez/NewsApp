part of 'get_articles_cubit.dart';

@immutable
sealed class GetArticlesState {}

final class GetArticlesInitial extends GetArticlesState {}
final class GetArticlesLoading extends GetArticlesState {}
final class GetArticlesSuccess extends GetArticlesState {
  final List<ArticlesEntity> articles;
  GetArticlesSuccess(this.articles);
}
final class GetArticlesError extends GetArticlesState {
  final String error;
  GetArticlesError(this.error);
}
