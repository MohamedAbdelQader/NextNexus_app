import 'package:flutter/cupertino.dart';
import 'package:next_nexus_app/Remote/Articles_Response/Article.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';

class ArticlesViewModel extends ChangeNotifier{
  bool showLoading=false;
  String? errorMessage;
  List<Article> articles = [];

  getArticles(String sourceId)async{
    try{
       showLoading=true;
       errorMessage=null;
       articles=[];
      notifyListeners();

      var articlesResponse= await ApiManager.getArticles(sourceId);
      showLoading=false;

      if(articlesResponse?.status=="error"){
       // handle logic server error
       errorMessage=articlesResponse?.message;

     }else{
       // handle logic success
        showLoading=false;

        articles=articlesResponse?.articles ?? [];

     }
     notifyListeners();



    }catch(e){
      showLoading=false;

      // handle logic client error
      errorMessage=e.toString();
      notifyListeners();



    }
  }
  
  
}