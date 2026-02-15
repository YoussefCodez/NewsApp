import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news/features/home/presentation/widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<String> categories = const [
    "General",
    "Business",
    "Entertainment",
    "Health",
    "Science",
    "Technology",
    "Sports",
  ];
  final List<String> images = const [
    "assets/images/world.png",
    "assets/images/money.png",
    "assets/images/popcorn.png",
    "assets/images/health.png",
    "assets/images/machine.png",
    "assets/images/ram.png",
    "assets/images/goat.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Gap(5.h),
            Text(
              "Good Morning\nHere Is Some News For You",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: .w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Gap(16.h),
            ListView.separated(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CategoryCard(
                  image: images[index],
                  title: categories[index],
                  rtl: index % 2 == 0 ? false : true,
                );
              },
              separatorBuilder: (context, index) {
                return Gap(16.h);
              },
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
