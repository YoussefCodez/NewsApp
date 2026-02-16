import 'package:dartz/dartz.dart';
import 'package:news/core/entites/articles_entity.dart';

abstract class GetArticlesRepo {
  Future<Either<String, List<ArticlesEntity>>> getArticles(String sourceId);
}

