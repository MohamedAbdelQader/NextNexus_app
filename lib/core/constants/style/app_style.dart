import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/core/constants/app_colors/app_colors.dart';

class AppStyle{
  static  ThemeData lightTheme= ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        color: AppColors.iconColor,
        fontWeight: FontWeight.w700
      ),
      titleSmall: TextStyle(
        fontSize: 22.sp,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w700
      )
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white, size: 35.sp),
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        )),
      titleTextStyle:  TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          ),
    )
  );
}