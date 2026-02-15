import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:news/features/home/presentation/cubit/pages_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      width: 270.w,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            color: Colors.white,
            child: Center(
              child: Text(
                "News App",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: .w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.all(15.r),
            child: Column(
              children: [
                Gap(16.h),
                DrawerRow(
                  svg: "home.svg",
                  text: "Go To Home",
                  onTap: () {
                    context.read<PagesCubit>().changePage("home");
                    Navigator.pop(context);
                  },
                ),
                Gap(24.h),
                const Divider(color: Colors.white, thickness: 1),
                Gap(24.h),
                DrawerRow(
                  svg: "theme.svg",
                  text: "Theme",
                  initialSelection: "light",
                  entries: const [
                    DropdownMenuEntry(
                      value: "light",
                      label: "Light",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.white),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: "dark",
                      label: "Dark",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.white),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    // TODO: Implement theme switching
                  },
                ),
                Gap(24.h),
                const Divider(color: Colors.white, thickness: 1),
                Gap(24.h),
                DrawerRow(
                  svg: "lang.svg",
                  text: "Language",
                  initialSelection: "en",
                  entries: const [
                    DropdownMenuEntry(
                      value: "en",
                      label: "English",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.white),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: "ar",
                      label: "Arabic",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.white),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    // TODO: Implement language switching
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    super.key,
    required this.svg,
    required this.text,
    this.entries,
    this.onSelected,
    this.initialSelection,
    this.onTap,
  });
  final String svg;
  final String text;
  final List<DropdownMenuEntry<String>>? entries;
  final void Function(String?)? onSelected;
  final String? initialSelection;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/$svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              Gap(8.w),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          if (entries != null) ...[
            Gap(8.h),
            DropdownMenu<String>(
              width: 240.w, // Fixed width to fit drawer better
              initialSelection: initialSelection,
              onSelected: onSelected,
              trailingIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              ),
              selectedTrailingIcon: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white,
              ),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: const BorderSide(color: Colors.white54),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              dropdownMenuEntries: entries!,
            ),
          ],
        ],
      ),
    );
  }
}
