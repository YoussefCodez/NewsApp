part of 'get_sources_cubit.dart';

@immutable
sealed class GetSourcesState {}

final class GetSourcesInitial extends GetSourcesState {}

final class GetSourcesLoading extends GetSourcesState {}

final class GetSourcesSuccess extends GetSourcesState {
  List<SourcesEntity> sources;
  GetSourcesSuccess(this.sources);
  
  
  List<Object?> get props => [sources];
}

final class GetSourcesError extends GetSourcesState {
  String error;
  GetSourcesError(this.error);

  List<Object?> get props => [error];
}
  
