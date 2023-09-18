import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:module_app/internal/models/models.dart';

class HttpController extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '86ae66d19fd2418e8c67f14687972295'; //Ganti ke API KEY yang sudah didapat
  static const String _category = 'business';
  static const String _country = 'us'; //us maksudnya United States ya

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs; // Observable boolean for loading state

  // static final http.Client _client = http.Client();

  @override
  onInit() async {
    await fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response =
          await http.get(Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
        // return articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        // return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      // return [];
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }
}
