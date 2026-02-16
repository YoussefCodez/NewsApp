import 'package:dartz/dartz.dart';
import 'package:news/core/entites/articles_entity.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/services/api/api_manager.dart';
import 'package:news/features/search/domain/repositories/get_articles_by_search_repo.dart';

class GetArticlesBySearchImpl implements GetArticlesBySearchRepo {
  @override
  Future<Either<String, List<ArticlesEntity>>> getArticlesBySearch(
    String keyword,
  ) async {
    try {
      var response = await ApiManager.dio.get(
        '/v2/everything?q=$keyword&apiKey=5803693e53a94c9eb4a8e8cbb81b0dcc',
      );
      return Right(ArticleModel.fromJson(response.data).toEntity().articles!);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
