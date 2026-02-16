import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/presentation/cubit/category_cubit.dart';
import 'package:news/features/home/presentation/cubit/pages_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.rtl,
  });
  final String image;
  final String title;
  final bool rtl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PagesCubit>().changePage("news");
        context.read<CategoryCubit>().changeCategory(title);
      },
      child: Directionality(
        textDirection: rtl ? .rtl : .ltr,
        child: Container(
          width: double.infinity,
          height: 196.h,
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(child: Image.asset(image, fit: .cover)),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: rtl ? .end : .start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: .w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Stack(
                      clipBehavior: .none,
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            start: 16.w,
                            end: 50.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: .w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          right: rtl ? null : -5.w,
                          left: rtl ? -5.w : null,
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            alignment: .center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
