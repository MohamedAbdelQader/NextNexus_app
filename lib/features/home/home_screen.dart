import 'package:flutter/material.dart';
import 'package:next_nexus_app/core/constants/app_images/app_images.dart';
import 'package:next_nexus_app/features/home/Widgets/Category_Details/category_details_widget.dart';

import '../../core/constants/custom-widgets/custom_drawer.dart';
import 'Widgets/Categories_Widget/categories_view.dart';
import 'Widgets/Settings_Widget/settings_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesView(
      showCategoryDetails: showCategoryDetailsWidget,
    );
  }

  void showCategoryDetailsWidget(String Category) {
    setState(() {
      selectedWidget = CategoryDetailsWidget( category: Category);
    });
  }

  void updateSelectedWidget(Widget widget) {
    setState(() {
      selectedWidget = widget;
    });
    Navigator.pop(context);
  }



  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        drawer: Drawer(
          child:CustomDrawer(
            onCategoryTap: () => updateSelectedWidget(CategoriesView(
              showCategoryDetails: showCategoryDetailsWidget,
            )),
            onSettingsTap: () => updateSelectedWidget(SettingsView()),
          ),
        ),
        appBar: AppBar(
          title: Text("NextNexus"),
        ),
        body: selectedWidget,

      ),
    );
  }


}
