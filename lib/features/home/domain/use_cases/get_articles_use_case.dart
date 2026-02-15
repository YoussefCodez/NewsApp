import 'package:dartz/dartz.dart';
import 'package:news/features/home/domain/entites/articles_entity.dart';
import 'package:news/features/home/domain/repositories/get_articles_repo.dart';

class GetArticlesUseCase {
  final GetArticlesRepo getArticlesRepo;
  GetArticlesUseCase(this.getArticlesRepo);
  Future<Either<String, List<ArticlesEntity>>> getArticles(String sourceId) {
    return getArticlesRepo.getArticles(sourceId);
  }
}