import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/features/home/Widgets/Categories_Widget/category_model.dart';

class CategoryItem extends StatelessWidget {
  final categoryModel;
  final int index;
  final  Function(String category) showCategoryDetails;
  const CategoryItem({
    required this.categoryModel,
    required this.index,
    required this.showCategoryDetails,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>showCategoryDetails(categoryModel.id),
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25.r:0.r),
            bottomRight: Radius.circular(index.isOdd?25.r:0.r),
          )
        ),
        child: Column(
          children: [
            Image.asset(
            categoryModel.image,
              height: 116.h,
              width: 132.w,

        ),
            Text(categoryModel.title,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),)
        ]
        ),
      ),
    );
  }
}
