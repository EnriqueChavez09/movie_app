import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';

final String baseUrl = Environment.apiUrl;
final String apiKey = Environment.apiKey;

class ApiService {
  Future<List<MovieModel>> getMovies() async {
    Uri url = Uri.parse("${baseUrl}discover/movie?api_key=$apiKey");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List movies = data["results"];
    List<MovieModel> listMoviesModel = [];
    listMoviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    return listMoviesModel;
  }

  Future<MovieDetailModel> getMovie(int id) async {
    Uri url = Uri.parse("${baseUrl}movie/$id?api_key=$apiKey");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(data);
    return movieDetailModel;
  }

  Future<List<CastModel>> getCasts(int id) async {
    Uri url = Uri.parse("${baseUrl}movie/$id/credits?api_key=$apiKey");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List casts = data["cast"];
    List<CastModel> listCastsModel = [];
    listCastsModel = casts.map((e) => CastModel.fromJson(e)).toList();
    return listCastsModel;
  }
}
