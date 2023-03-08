import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> listMoviesModel = [];
  List<GenreModel> listGenresModel = [];
  int idFilter = 0;
  int pageMovies = 1;
  ScrollController _movieScrollController = ScrollController();

  getDataMovies(int id, int page) async {
    ApiService apiService = ApiService();
    List<MovieModel> listMoviesNewModel = await apiService.getMovies(id, page);
    listMoviesModel = [...listMoviesModel, ...listMoviesNewModel];
    setState(() {});
    pageMovies++;
  }

  getDataGenres() async {
    ApiService apiService = ApiService();
    listGenresModel = await apiService.getGenres();
    listGenresModel.insert(
      0,
      GenreModel(id: 0, name: "All"),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataMovies(idFilter, pageMovies);
    getDataGenres();
    _movieScrollController.addListener(() {
      if (_movieScrollController.offset >=
          _movieScrollController.position.maxScrollExtent) {
        getDataMovies(idFilter, pageMovies);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "TotalCinema",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          listGenresModel.length,
                          (index) => ItemCategoryWidget(
                            genre: listGenresModel[index],
                            isSelected: listGenresModel[index].id == idFilter,
                            onTap: () {
                              idFilter = listGenresModel[index].id;
                              listMoviesModel = [];
                              pageMovies = 1;
                              getDataMovies(idFilter, pageMovies);
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: _movieScrollController,
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(12.0),
                itemCount: listMoviesModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemMovieWidget(
                    movie: listMoviesModel[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "detail",
                        arguments: MovieArgumentModel(
                          id: listMoviesModel[index].id,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _movieScrollController.dispose();
  }
}
