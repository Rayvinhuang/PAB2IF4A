import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '98aead1a5918f016504fc4917f7b5b6a';

  Future<List<Map<String, dynamic>>> getAllMovie() async {
    final response = await http:get(Url.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>> from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovie() async {
    final response = await http:get(Url.parse('$baseUrl/trending/movie/week?api_key=$apiKey'))
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>> from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getPopularMovie() async {
    final response = await http:get(Url.parse('$baseUrl/movie/popular?api_key=$apiKey'))
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>> from(data['results']);
  }
}