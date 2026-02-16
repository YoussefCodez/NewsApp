import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/presentation/cubit/category_cubit.dart';
import 'package:news/features/home/presentation/cubit/get_articles_cubit.dart';
import 'package:news/features/home/presentation/cubit/get_sources_cubit.dart';
import 'package:news/features/home/presentation/cubit/pages_cubit.dart';
import 'package:news/features/home/presentation/widgets/home_page.dart';
import 'package:news/features/home/presentation/widgets/my_drawer.dart';
import 'package:news/features/home/presentation/widgets/news_page.dart';
import 'package:news/features/search/presentation/cubit/get_articles_by_search_cubit.dart';
import 'package:news/features/search/presentation/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PagesCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => GetSourcesCubit()),
        BlocProvider(create: (context) => GetArticlesCubit()),
      ],
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: .w500,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => GetArticlesBySearchCubit(),
                      child: const SearchScreen(),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        body: BlocBuilder<PagesCubit, String>(
          builder: (context, state) {
            if (state == "home") {
              return HomePage();
            } else if (state == "news") {
              return NewsPage();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
