import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/core/services/api_manager.dart';
import 'package:news/features/core/theme/app_theme.dart';
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          home: const SplashScreen(),
        );
      },
    );
  }
}
