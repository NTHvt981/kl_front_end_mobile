import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String url;

  NewsDetailPage({
    Key? key,
    required this.title,
    required this.url
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(initialUrl: url,),
    );
  }
}
