import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/data/repositories/get_articles_impl.dart';
import 'package:news/features/home/domain/entites/articles_entity.dart';
import 'package:news/features/home/domain/use_cases/get_articles_use_case.dart';

part 'get_articles_state.dart';

class GetArticlesCubit extends Cubit<GetArticlesState> {
  GetArticlesCubit() : super(GetArticlesInitial());

  Future<void> getArticles(String sourceId) async {
    emit(GetArticlesLoading());
    var result = await GetArticlesUseCase(GetArticlesImpl()).getArticles(sourceId);
    result.fold((l) => emit(GetArticlesError(l)), (r) => emit(GetArticlesSuccess(r)));
  }
}
