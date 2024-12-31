import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/core/constants/style/app_style.dart';
import 'package:next_nexus_app/features/home/Widgets/Categories_Widget/categories_view.dart';
import 'package:next_nexus_app/features/home/Widgets/Settings_Widget/settings_view.dart';

import 'features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        routes: {
          HomeScreen.routeName: (_) =>  HomeScreen(),
          SettingsView.routeName: (_) =>  SettingsView(),
        },
        initialRoute: HomeScreen.routeName,
        debugShowCheckedModeBanner: false,
        title: 'NextNexus',
        theme: AppStyle.lightTheme,
        home: child,
      ),
      child:  HomeScreen(),
    );
  }
}
