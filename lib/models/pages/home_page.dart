import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/globals/globals.dart';
import 'package:movie_app/models/models.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];
  final String _baseUrl = Environment.apiUrl;
  final String _baseUrlImage = Environment.apiUrlImage;
  final String _apiKey = Environment.apiKey;

  getDataInternet() async {
    Uri url = Uri.parse("${_baseUrl}discover/movie?api_key=$_apiKey");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List movies = data["results"];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: moviesModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "$_baseUrlImage${moviesModel[index].posterPath}",
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        CustomColors.backgroundColor.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          moviesModel[index].originalTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "(${moviesModel[index].releaseDate.year})",
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
