import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/api/api_manager.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/core/theme/cubit/theme_cubit.dart';
import 'package:news/features/splash/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ApiManager.init();
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.themeMode,
                scrollBehavior: const ScrollBehavior().copyWith(
                  overscroll: false,
                ),
                home: const SplashScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
