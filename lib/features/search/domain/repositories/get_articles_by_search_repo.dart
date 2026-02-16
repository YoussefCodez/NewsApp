import 'package:dartz/dartz.dart';
import 'package:news/core/entites/articles_entity.dart';

abstract class GetArticlesBySearchRepo {
  Future<Either<String, List<ArticlesEntity>>> getArticlesBySearch(
    String keyword,
  );
}
