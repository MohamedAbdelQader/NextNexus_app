import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:next_nexus_app/Data/dataSource/ArticlesDao.dart';
import 'package:next_nexus_app/features/home/Widgets/Articles_widget/article_model.dart';

import '../../Remote/Articles_Response/Article.dart';
import '../../repository/articlesRepo.dart';
@Injectable(as: ArticlesRepo)
class ArticlesRepoImp extends ArticlesRepo{
  ArticlesDao articlesDao;
@factoryMethod
  ArticlesRepoImp(this.articlesDao);
  @override
  Future<Either<List<Article>, String>>getArticles(String sourceId){
  return articlesDao.getArticles(sourceId);
  }

}