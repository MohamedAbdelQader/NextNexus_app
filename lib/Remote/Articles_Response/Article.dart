
import '../Sources_Response/Source.dart';

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "Lalee Ibssa"
/// title : "Musk, Ramaswamy spar with Trump supporters over H-1B work visas"
/// description : "Musk and Ramaswamy have found themselves at odds with some of Trump's supporters over their support for H-1B visas, which allow foreign professionals to work in America."
/// url : "https://abcnews.go.com/Politics/musk-ramaswamy-spar-trump-supporters-support-1b-work/story?id=117147209"
/// urlToImage : "https://i.abcnewsfe.com/a/9d1a3d7d-3ce7-4318-bed0-5e5ab2be1b3e/vivek-ramaswamy-elon-musk-gty-lv-241217-2_1734460473250_hpMain_16x9.jpg?w=1600"
/// publishedAt : "2024-12-28T22:44:37Z"
/// content : "Elon Musk and Vivek Ramaswamy, the leaders of President-elect Donald Trump's new \"Department of Government Efficiency,\" have found themselves at odds with some of Trump's far-right supporters over th… [+4977 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}