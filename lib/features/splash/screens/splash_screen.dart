import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/theme/cubit/theme_cubit.dart';
import 'package:news/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return (state.themeMode == ThemeMode.light
                    ? Image.asset('assets/images/light_logo.png')
                    : Image.asset('assets/images/dark_logo.png'))
                .animate(
                  onComplete: (controller) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ),
                )
                .fadeIn(duration: 1.seconds)
                .scale(duration: 1.seconds);
          },
        ),
      ),
    );
  }
}
