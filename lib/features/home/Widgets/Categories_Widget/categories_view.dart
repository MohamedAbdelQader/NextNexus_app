import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/core/constants/custom-widgets/category_item.dart';

import 'category_model.dart';

class CategoriesView extends StatelessWidget {
  static const routeName = 'categories';
  final void Function(String Category) showCategoryDetails;
  CategoriesView({required this.showCategoryDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:REdgeInsets.all(36),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Pick your Category
of interest''',style: Theme.of(context).textTheme.titleSmall,
      ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1/1,
            ),
            itemCount: CategoryModel.categories.length,
            itemBuilder: (context, index) => CategoryItem(
              showCategoryDetails: showCategoryDetails,
                categoryModel: CategoryModel.categories[index],
                index: index)
          )],
      ),
    );
  }
}
