import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget{
  final String articleUrl;

  ArticleWebView({this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: WebView(
          initialUrl: articleUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }


}