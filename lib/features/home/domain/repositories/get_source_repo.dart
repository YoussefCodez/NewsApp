import 'package:dartz/dartz.dart';

import 'package:news/features/home/domain/entites/sources_entity.dart';

abstract class GetSourceRepo {
  Future<Either<String, List<SourcesEntity>>> getSources(String category);
}
