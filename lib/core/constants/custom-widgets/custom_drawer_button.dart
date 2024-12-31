import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../app_images/app_images.dart';

class CustomDrawerButton extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  CustomDrawerButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  REdgeInsets.only(left: 16),
        child: Row(
            spacing: 10.w,
            children: [
              SvgPicture.asset(icon,height: 22.h,width: 25.w,),
              Text(title,style: Theme.of(context).textTheme.titleMedium,)
            ]),
      ),
    );
  }
}
