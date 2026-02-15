import 'package:dartz/dartz.dart';
import 'package:news/features/home/domain/entites/sources_entity.dart';
import 'package:news/features/home/domain/repositories/get_source_repo.dart';

class GetSourceUseCase {
  GetSourceRepo getSourceRepo;
  GetSourceUseCase(this.getSourceRepo);
  Future<Either<String, List<SourcesEntity>>> getSources(String category) {
    return getSourceRepo.getSources(category);
  }
}