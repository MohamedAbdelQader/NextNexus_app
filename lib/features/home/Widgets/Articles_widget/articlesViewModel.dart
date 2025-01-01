import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:next_nexus_app/repository/articlesRepo.dart';

import '../../../../Remote/Articles_Response/Article.dart';
import '../../../../Remote/api_manager.dart';
@injectable
class ArticlesViewModel extends Cubit<ArticlesStates> {
  ArticlesRepo repo;
  @factoryMethod
  ArticlesViewModel(this.repo):super(LoadingState());
  getArticles(String sourceId)async{
    try{
      emit(LoadingState());

      var result=await repo.getArticles(sourceId);
        result.fold((articles) =>
            emit(SuccessState(articles)),
                (error) => emit(ErrorState(error)));

    }catch(error){
      emit(ErrorState(error.toString()));


    }
  }



}

abstract class ArticlesStates{}
class LoadingState extends ArticlesStates{}
class ErrorState extends ArticlesStates{
  String errorMessage;
  ErrorState(this.errorMessage);
}
class SuccessState extends ArticlesStates{
  List<Article> articles;
  SuccessState(this.articles);
}