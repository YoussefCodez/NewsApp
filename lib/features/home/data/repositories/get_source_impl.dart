import 'package:dartz/dartz.dart';
import 'package:news/features/core/const/app_const.dart';
import 'package:news/features/core/services/api_manager.dart';
import 'package:news/features/home/data/models/source_model.dart';
import 'package:news/features/home/domain/entites/sources_entity.dart';
import 'package:news/features/home/domain/repositories/get_source_repo.dart';

class GetSourceImpl implements GetSourceRepo {
  @override
  Future<Either<String, List<SourcesEntity>>> getSources(String category) async {
    try {
      var response = await ApiManager.dio.get(
        "/v2/top-headlines/sources",
        queryParameters: {
          "category": category,
          "apiKey": AppConst.apiKey,
        },
      );
      var sourceEntity = SourceModel.fromJson(response.data).toEntity();
      return Right(sourceEntity.sources ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
