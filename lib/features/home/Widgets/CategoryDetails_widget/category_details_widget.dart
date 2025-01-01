import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Remote/Sources_Response/Source.dart';
import '../Articles/articles_List.dart';
import 'categoryDetailsViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDetailsWidget extends StatefulWidget {
  final String category;

  const CategoryDetailsWidget({super.key, required this.category});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryDetailsViewModel()..getSources(widget.category),
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    viewModel.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        viewModel.getSources(widget.category);
                      });
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          List<Source> sources = viewModel.sources;

          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding:  REdgeInsets.all(16.0),
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    dividerHeight: 0,
                    tabs: sources.map((source) => Tab(

                      child: Container(
                          padding: REdgeInsets.symmetric(
                              horizontal:20,
                              vertical: 5 ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Text(source.name??"")),
                    )).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                        children: sources.map((source) =>
                            ArticlesList(sourceId: source.id??"",)
                        ).toList()),
                  )

                ],
              ),
            ),
          );        },
      ),
    );
  }
}

