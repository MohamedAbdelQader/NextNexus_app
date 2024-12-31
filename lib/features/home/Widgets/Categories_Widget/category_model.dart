
import 'dart:ui';

import 'package:next_nexus_app/core/constants/app_images/app_images.dart';

import '../../../../core/constants/app_colors/app_colors.dart';

class CategoryModel {
  final String id;

  final String title;
  final String image;
  final Color background;
  CategoryModel({ required this.id,required this.title,required this.image,required this.background});

  static List<CategoryModel> categories=[
    CategoryModel(id: "sports",title: "Sports",image: AppImages.sports_img ,background: AppColors.bgSportsColor ),
    CategoryModel(id: "general",title: "General",image: AppImages.politics_img ,background: AppColors.bgPoliticsColor ),
    CategoryModel(id: "health",title: "Health",image: AppImages.health_img ,background: AppColors.bgHealthColor ),
    CategoryModel(id: "business",title: "Business",image: AppImages.bussiness_img ,background: AppColors.bgBusinessColor ),
    CategoryModel(id: "technology",title: "Technology",image: AppImages.environment_img ,background: AppColors.bgEnvironmentColor ),
    CategoryModel(id: "science",title: "Science",image: AppImages.science_img ,background: AppColors.bgScienceColor ),
  ];
}