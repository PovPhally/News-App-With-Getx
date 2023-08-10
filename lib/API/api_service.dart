import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_res_model.dart';

class APIServices {
  final url =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-08-07&sortBy=publishedAt&apiKey=9d57c266c13443189d1ccf02bca0d3d0';

  Future<NewsResModel> getNews() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
