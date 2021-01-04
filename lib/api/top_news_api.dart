import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/response.dart';

final apiKey = "62a207383f904b4289ccae78c1f1e064";

Future<Response> getTopHeadlines() async {
  String topHeadlinesUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
  http.Response responseFromApi = await http.get(topHeadlinesUrl);
  Response response = Response.fromJson(jsonDecode(responseFromApi.body));
  return response;
}

 Future<Response> getTopHeadlinesByCategory({String category}) async {
  String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
  http.Response responseFromApi = await http.get(url);
  Response response = Response.fromJson(jsonDecode(responseFromApi.body));
  return response;
}
