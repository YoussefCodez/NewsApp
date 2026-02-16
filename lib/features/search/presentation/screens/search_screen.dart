import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news/features/search/presentation/cubit/get_articles_by_search_cubit.dart';
import 'package:news/core/widgets/article_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;
  Timer? _debounce;
  @override
  void initState() {
    controller = .new();
    Future.microtask(() {
      context.read<GetArticlesBySearchCubit>().getArticlesBySearch("keyword");
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: SizedBox(
          width: double.infinity,
          child: TextField(
            autofocus: true,
            controller: controller,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: .w500,
              color: Theme.of(context).colorScheme.secondary,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: .w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    controller.clear();
                    context
                        .read<GetArticlesBySearchCubit>()
                        .getArticlesBySearch("keyword");
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  context.read<GetArticlesBySearchCubit>()
                      .getArticlesBySearch(value);
                });
              } else {
                context.read<GetArticlesBySearchCubit>().getArticlesBySearch(
                  "keyword",
                );
              }
            },
          ),
        ),
      ),
      body: BlocBuilder<GetArticlesBySearchCubit, GetArticlesBySearchState>(
        builder: (context, state) {
          if (state is GetArticlesBySearchLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (state is GetArticlesBySearchError) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: .w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }
          if (state is GetArticlesBySearchSuccess) {
            return ListView.separated(
              itemCount: state.articles.length,
              separatorBuilder: (context, index) {
                return Gap(16.h);
              },
              itemBuilder: (context, index) {
                return ArticleWidget(articles: state.articles[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
