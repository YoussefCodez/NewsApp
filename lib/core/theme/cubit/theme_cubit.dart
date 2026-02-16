import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/local_storage/hive_manager.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    _loadTheme();
  }

  void _loadTheme() {
    final themeString = HiveManager.getTheme();
    if (themeString == 'dark') {
      emit(ThemeChanged(ThemeMode.dark));
    } else {
      emit(ThemeChanged(ThemeMode.light));
    }
  }

  void changeTheme(String theme) {
    HiveManager.saveTheme(theme);
    if (theme == 'dark') {
      emit(ThemeChanged(ThemeMode.dark));
    } else {
      emit(ThemeChanged(ThemeMode.light));
    }
  }
}
