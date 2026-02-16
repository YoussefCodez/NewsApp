import 'package:dartz/dartz.dart';
import 'package:news/core/entites/articles_entity.dart';
import 'package:news/features/search/domain/repositories/get_articles_by_search_repo.dart';

class GetArticlesBySearchUseCase {
  final GetArticlesBySearchRepo repo;
  GetArticlesBySearchUseCase({required this.repo});

  Future<Either<String, List<ArticlesEntity>>> call(String keyword) async {
    return await repo.getArticlesBySearch(keyword);
  }
}