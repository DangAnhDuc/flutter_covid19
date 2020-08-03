import 'package:flutter_covid19/model/news/articles.dart';
import 'package:flutter_covid19/services/network_services.dart';

import '../../apikeys.dart';

class NewsData {
  List<Article> articles = [];
  String url =
      'https://newsapi.org/v2/everything?q=covid-19&sortBy=publishedAt&from=2020-06-29&language=en&apiKey=$newsApiKey';
  refresh() async {
    var data = await NetworkService.fetchData(url);
    List newsData = data['articles'];
    newsData.forEach((article) {
      if (article['title'] != null &&
          article['url'] != null &&
          article['urlToImage'] != null &&
          article['content'] != null) {
        articles.add(Article(
          author: article['author'],
          title: article['title'],
          description: article['description'],
          url: article['url'],
          urlImage: article['urlToImage'],
          publishedAt: article['publishedAt'],
          content: article['content'],
        ));
      }
    });
  }
}
