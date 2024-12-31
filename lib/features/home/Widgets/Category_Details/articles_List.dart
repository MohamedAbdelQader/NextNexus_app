import 'package:flutter/material.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
import 'package:next_nexus_app/features/home/Widgets/Category_Details/article_model.dart';

import '../../../../Remote/Articles_Response/Article.dart';
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
    return FutureBuilder(
        future: ApiManager.getArticles(widget.sourceId),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {
                  setState(() {});
                },
                    child: Text("Retry")),

              ],
            );
          }
          var response = snapshot.data;
          if (response?.status == "error") {
            return Column(
              children: [
                Text(response?.message.toString() ?? ""),
                ElevatedButton(onPressed: () {
                  setState(() {});
                },
                    child: Text("Retry")),
              ],
            );
          }
          List<Article>? articles = response?.articles ?? [];
          return ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(article: articles[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: articles.length);
        });
  }
}
