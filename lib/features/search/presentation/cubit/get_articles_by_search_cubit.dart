import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/core/entites/articles_entity.dart';
import 'package:news/features/search/data/repositories/get_articles_by_search_impl.dart';
import 'package:news/features/search/domain/use_cases/get_articles_by_search_use_case.dart';

part 'get_articles_by_search_state.dart';

class GetArticlesBySearchCubit extends Cubit<GetArticlesBySearchState> {
  GetArticlesBySearchCubit() : super(GetArticlesBySearchInitial());

  Future<void> getArticlesBySearch(String keyword) async {
    emit(GetArticlesBySearchLoading());
    var result = await GetArticlesBySearchUseCase(
      repo: GetArticlesBySearchImpl(),
    ).call(keyword);
    result.fold(
      (l) => emit(GetArticlesBySearchError(error: l)),
      (r) => emit(GetArticlesBySearchSuccess(articles: r)),
    );
  }
}
