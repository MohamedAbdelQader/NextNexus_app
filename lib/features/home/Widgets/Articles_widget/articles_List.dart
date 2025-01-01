import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_nexus_app/DI/Di.dart';
import 'package:next_nexus_app/Data/respository_imp/articlesRepoImp.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
import 'package:next_nexus_app/features/home/Widgets/Articles_widget/articlesViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Data/dataSource_imp/ArticlesApiDaoImp.dart';
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
    return BlocProvider(
      create: (context) => getIt.get<ArticlesViewModel>()..getArticles(widget.sourceId),
      child: BlocBuilder<ArticlesViewModel,ArticlesStates>(
          builder: (context, state) {
            if (state is ErrorState) {
              return Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(onPressed: (){
                    BlocProvider.of<ArticlesViewModel>(context).getArticles(widget.sourceId);
                  } ,
                      child:  Text("Retry")),
                ],
              );
            }
            if(state is SuccessState) {
              List<Article> articles = state.articles;
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articles[index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: articles.length);}
            return const Center(child: CircularProgressIndicator(),);
          }),

    );

  }
}
/*
* return ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(article: articles[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: articles.length);*/