import 'package:dartz/dartz.dart';

import '../Remote/Articles_Response/Article.dart';
import '../features/home/Widgets/Articles_widget/article_model.dart';

abstract class ArticlesRepo {
  Future<Either<List<Article>, String>>getArticles(String sourceId);
}