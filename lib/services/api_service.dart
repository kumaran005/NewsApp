import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/article_model.dart';

class ApiServices {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=a4cbf790858b40b5b5c032a2d945f59d";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Article");
    }
  }
}
