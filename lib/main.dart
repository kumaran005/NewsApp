import 'package:flutter/material.dart';
import 'package:newsapp/components/customTile.dart';
import 'package:newsapp/services/api_service.dart';

import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiServices client = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("News",
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold)),
          Text("Hunt",
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold))
        ]),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customTiles(articles[index], context),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black54,
                valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
              ),
            );
          }),
    );
  }
}
