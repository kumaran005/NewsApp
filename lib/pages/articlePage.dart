import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/webView.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title != null ? article.title : 'NewsHunt'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage != null
                          ? article.urlToImage
                          : "Not Mentioned"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(height: 8),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(article.source.name != null
                    ? article.source.name
                    : 'Dafault value'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.description != null
                  ? article.description
                  : 'Not Mentioned',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.author != null
                      ? article.author
                      : "Not Mentioned"),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.publishedAt != null
                      ? article.publishedAt
                      : "Not Mentioned"),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Text(
                      article.content != null
                          ? article.content
                          : "Not Mentioned",
                    ),
                  ),
                  GestureDetector(
                      child: Icon((Icons.open_in_new)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View(article: article)));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
