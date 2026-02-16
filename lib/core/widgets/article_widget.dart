import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/entites/articles_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.articles});
  final ArticlesEntity articles;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Padding(
              padding: REdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                margin: REdgeInsets.all(16),
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: articles.urlToImage ?? "",
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CupertinoActivityIndicator()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ),
                    Gap(16.h),
                    Text(
                      articles.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Gap(24.h),
                    ElevatedButton(
                      onPressed: () {
                        nowlaunchUrl(Uri.parse(articles.url ?? ""));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        foregroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        "View Full Article",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(16.h),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
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
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: .cover,
                placeholder: (context, url) =>
                    const Center(child: CupertinoActivityIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
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
                  timeago.format(
                    DateTime.parse(articles.publishedAt ?? ""),
                    allowFromNow: true,
                    locale: "en",
                  ),
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
      ),
    );
  }
}

Future<void> nowlaunchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
