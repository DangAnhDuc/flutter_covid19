import 'package:flutter_covid19/model/news/articles.dart';
import 'package:flutter_covid19/services/network_services.dart';

import '../../apikeys.dart';

class TopheadlinesData{
  String url= 'https://newsapi.org/v2/top-headlines?country=in&q=covid-19&apiKey=$newsApiKey';
  List<Article> headlines=[];

  refresh() async{
    var headlineData= await NetworkService.fetchData(url);
    List articles= headlineData['articles'];
    
    articles.forEach((article) {
      headlines.add(Article(
          author: article['author'],
          title: article['title'],
          description: article['description'],
          url: article['url'],
          urlImage: article['urlToImage'],
          publishedAt: article['publishedAt'],
          content: article['content'])
      );
    });
    
    headlines.forEach((element) {print('Title: ${element.title}');});
  }
}