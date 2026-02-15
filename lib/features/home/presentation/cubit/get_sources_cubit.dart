import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/data/repositories/get_source_impl.dart';
import 'package:news/features/home/domain/entites/sources_entity.dart';
import 'package:news/features/home/domain/use_cases/get_source_use_case.dart';

part 'get_sources_state.dart';

class GetSourcesCubit extends Cubit<GetSourcesState> {
  GetSourcesCubit() : super(GetSourcesInitial());

  GetSourceUseCase getSourcesUseCase = GetSourceUseCase(GetSourceImpl());
  Future<void> getSources(String category) async {
    emit(GetSourcesLoading());
    var result = await getSourcesUseCase.getSources(category);
    result.fold((l) {
      emit(GetSourcesError(l));
    }, (r) {
      emit(GetSourcesSuccess(r));
    });
  }
}
