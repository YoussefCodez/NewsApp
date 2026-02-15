import 'package:news/features/home/domain/entites/articles_entity.dart';

class ArticleEntity {
  String? status;
  int? totalResults;
  List<ArticlesEntity>? articles;

  ArticleEntity({this.status, this.totalResults, this.articles});
}