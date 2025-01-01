import 'package:dartz/dartz.dart';

import '../../Remote/Articles_Response/Article.dart';

abstract class ArticlesDao {
  Future<Either<List<Article>, String>>getArticles(String sourceId);
}