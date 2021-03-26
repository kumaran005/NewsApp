import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class View extends StatefulWidget {
  const View({
    GlobalKey key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        elevation: 0,
      ),
      body: WebView(
        initialUrl: widget.article.url != null
            ? widget.article.url
            : "https://www.google.com",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      /* Center(child: Text(widget.article.url))*/
    );
  }
}
