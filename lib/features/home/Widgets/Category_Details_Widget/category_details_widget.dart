import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'categoryDetailsViewModel.dart';

import 'package:next_nexus_app/features/home/Widgets/Category_Details_Widget/categoryDetailsViewModel.dart';

import '../../../../DI/Di.dart';
import '../../../../Remote/Sources_Response/Source.dart';
import '../Articles_widget/articles_List.dart';
@injectable
class CategoryDetailsWidget extends StatefulWidget {
  String category;
  @factoryMethod
  CategoryDetailsWidget({super.key, required this.category});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CategoryDetailsViewModel>()..getSources(widget.category),
      child: BlocBuilder<CategoryDetailsViewModel, CategoryDetailsStates>(
          builder: (context, state) {
        if (state is ErrorState) {
          return Column(
            children: [
              Text(state.errorMessage),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CategoryDetailsViewModel>(context)
                        .getSources(widget.category);
                  },
                  child: Text("Retry")),
            ],
          );
        }
        if (state is SuccessState) {
          List<Source> sources = state.sources;
          return DefaultTabController(
              length: sources.length,
              child: Padding(
                padding: REdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.primary,
                      dividerHeight: 0,
                      tabs: sources
                          .map((source) => Tab(
                                child: Container(
                                    padding: REdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Text(source.name ?? "")),
                              ))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                          children: sources
                              .map((source) => ArticlesList(
                                    sourceId: source.id ?? "",
                                  ))
                              .toList()),
                    )
                  ],
                ),
              ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
