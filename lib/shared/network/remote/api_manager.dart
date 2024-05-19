import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route_course/models/source_response.dart';
import 'package:news_app_route_course/shared/components/constants.dart';

import '../../../models/news_response.dart';

class ApiManager {
  static Future<SourceRespons> getSources(String category) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=93157e6f1367486faba3467c008c89df
    Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": "93157e6f1367486faba3467c008c89df","category":category});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceRespons.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url =
        Uri.http(Constants.BASE_URL, "/v2/everything", {"sources": sourceId});
    http.Response response = await http
        .get(url, headers: {"x-api-key": "93157e6f1367486faba3467c008c89df"});
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
