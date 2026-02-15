import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news/features/core/theme/app_colors.dart';
import 'package:news/features/home/domain/entites/articles_entity.dart';
import 'package:news/features/home/presentation/cubit/get_articles_cubit.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.articles});
  final ArticlesEntity articles;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArticlesCubit, GetArticlesState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(16.r),
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                clipBehavior: .antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.network(
                  articles.urlToImage ?? "",
                  height: 220,
                  width: double.infinity,
                  fit: .cover,
                ),
              ),
              Gap(10.h),
              Text(
                articles.title ?? "",
                style: TextStyle(
                  fontWeight: .w700,
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Gap(10.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "By : ${articles.author}",
                      style: TextStyle(
                        fontWeight: .w500,
                        fontSize: 12.sp,
                        color: AppColors.thirdColor,
                      ),
                    ),
                  ),
                  Text(
                    articles.publishedAt ?? "",
                    style: TextStyle(
                      fontWeight: .w500,
                      fontSize: 12.sp,
                      color: AppColors.thirdColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
