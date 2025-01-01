import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:next_nexus_app/Data/dataSource/ArticlesDao.dart';
import 'package:next_nexus_app/Remote/Articles_Response/Article.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
@Injectable(as:ArticlesDao)
class ArticlesApiDaoImp extends ArticlesDao{
  ApiManager apiManager;
  @factoryMethod
  ArticlesApiDaoImp(this.apiManager);
  @override
  Future<Either<List<Article>, String>> getArticles(String sourceId) async{
    var response= await apiManager.getArticles(sourceId);
    if (response?.status=="error") {
      return Right(response?.message.toString() ?? "");
    }else{
      return Left(response?.articles??[]);
    }

  }

}