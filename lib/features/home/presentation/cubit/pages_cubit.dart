import 'package:bloc/bloc.dart';


class PagesCubit extends Cubit<String> {
  PagesCubit() : super("home");

  void changePage(String page) {
    emit(page);
  }
}
