import 'dart:convert';

import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getMovies(String type) async {
    final url = Uri.parse("$baseUrl/$type");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("url: $url response status: ${response.statusCode}");
    }
    final movies = jsonDecode(response.body)["results"];
    return movies
        .map<MovieModel>((movie) => MovieModel.fromJSON(movie))
        .toList();
  }

  static Future<MovieDetailModel> getDetailMovie(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("url: $url response status: ${response.statusCode}");
    }
    final movie = jsonDecode(response.body);
    return MovieDetailModel.fromJSON(movie);
  }
}
