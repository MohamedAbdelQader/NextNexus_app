import 'package:flutter/material.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Remote/Articles_Response/Article.dart';
import 'ArticlesViewModel.dart';
import 'article_item.dart';

class ArticlesList extends StatefulWidget {
  final String sourceId;
  const ArticlesList({Key? key, required this.sourceId}) : super(key: key);

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticlesViewModel()..getArticles(widget.sourceId),
        child: Consumer<ArticlesViewModel>(builder: (context, viewModel, child) {
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
                    onPressed: () {
                      setState(() {
                        viewModel.getArticles(widget.sourceId);
                      });
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          List<Article> articles = viewModel.articles;

          return ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(article: viewModel.articles[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: viewModel.articles.length);
        }),
    );

  }
}

