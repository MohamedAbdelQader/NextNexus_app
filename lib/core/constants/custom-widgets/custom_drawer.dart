import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/core/constants/app_images/app_images.dart';
import '../../../features/home/Widgets/Categories_Widget/categories_view.dart';
import '../../../features/home/Widgets/Settings_Widget/settings_view.dart';
import 'custom_drawer_button.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onCategoryTap;
  final VoidCallback onSettingsTap;
  CustomDrawer({required this.onCategoryTap, required this.onSettingsTap});


  @override
  Widget build(BuildContext context) {
    return  Column(
      spacing: 20.h,
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical:43),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r)),

            ),
              child: Text("NextNexus",style: Theme.of(context).textTheme.headlineMedium,)),
        CustomDrawerButton(
          title: "Categories",
          icon: AppImages.list_icon,
          onTap: onCategoryTap,
        ),
        CustomDrawerButton(
          title: "Settings",
          icon: AppImages.settings_icon,
          onTap:onSettingsTap ,
        )

      ],
    ) ;
  }
}
