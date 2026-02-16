import 'package:dartz/dartz.dart';
import 'package:news/core/const/app_const.dart';
import 'package:news/core/services/api/api_manager.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/entites/articles_entity.dart';
import 'package:news/features/home/domain/repositories/get_articles_repo.dart';

class GetArticlesImpl implements GetArticlesRepo {
  @override
  Future<Either<String, List<ArticlesEntity>>> getArticles(String sourceId) async {
    try {
      var response = await ApiManager.dio.get(
        '/v2/everything',
        queryParameters: {
          "sources": sourceId,
          "apiKey": AppConst.apiKey,
        },
      );
      return Right(ArticleModel.fromJson(response.data).toEntity().articles!);
    } catch (e) {
      return Left(e.toString());
    }
  }
}