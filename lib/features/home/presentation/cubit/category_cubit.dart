import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<String> {
  CategoryCubit() : super("general");

  void changeCategory(String category) {
    emit(category);
  }
}
