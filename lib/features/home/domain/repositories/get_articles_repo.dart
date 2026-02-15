import 'package:dartz/dartz.dart';
import 'package:news/features/home/domain/entites/articles_entity.dart';

abstract class GetArticlesRepo {
  Future<Either<String, List<ArticlesEntity>>> getArticles(String sourceId);
}

