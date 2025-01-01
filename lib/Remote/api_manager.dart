import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:next_nexus_app/Remote/constants.dart';

import 'Articles_Response/ArticlesResponse.dart';
import 'Sources_Response/SourcesResponse.dart';
@singleton
class ApiManager{

  Future<SourcesResponse?> getSources(String category)async {
   try{
     Uri url=Uri.https(baseUrl,sourcesEndpoint,{
       "category":category,
       "apiKey":apiKey
     }
     );
     var response=await http.get(url);
      Map<String,dynamic> json=jsonDecode(response.body);
      SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
      return sourcesResponse;

   }catch (error){
     print(error.toString());
  }
}
   Future<ArticlesResponse?> getArticles(String sourceId)async{
    try{
      Uri url=Uri.https(baseUrl,articlesEndpoint,{
        "sources":sourceId,
        "apiKey":apiKey
      });
      var response=await  http.get(url);
      Map<String,dynamic> json=jsonDecode(response.body);
      var articlesResponse=ArticlesResponse.fromJson(json);
      return articlesResponse;
    } catch (error) {
      print(error.toString());

    }
  }
}