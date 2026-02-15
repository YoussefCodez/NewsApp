import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news/features/home/domain/entites/articles_entity.dart';
import 'package:news/features/home/presentation/cubit/get_articles_cubit.dart';
import 'package:news/features/home/presentation/widgets/article_widget.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({super.key, required this.sourceId});
  final String sourceId;
  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  void initState() {
    context.read<GetArticlesCubit>().getArticles(widget.sourceId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArticlesCubit, GetArticlesState>(
      builder: (context, state) {
        return state is GetArticlesLoading
            ? const Center(child: CupertinoActivityIndicator())
            : state is GetArticlesError
            ? Center(child: Text(state.error))
            : ListView.separated(
          itemBuilder: (context, index) => ArticleWidget(articles: state is GetArticlesSuccess ? state.articles[index] : ArticlesEntity()),
          separatorBuilder: (context, index) => Gap(16.h),
          itemCount: state is GetArticlesSuccess ? state.articles.length : 0,
        );
      },
    );
  }
}
