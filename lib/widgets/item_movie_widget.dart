import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/globals/globals.dart';

class ItemMovieWidget extends StatelessWidget {
  MovieModel movie;
  void Function()? onTap;
  ItemMovieWidget({
    required this.movie,
    this.onTap,
  });
  final String _baseUrlImage = Environment.apiUrlImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "$_baseUrlImage${movie.posterPath}",
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
                      movie.originalTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "(${movie.releaseDate.year})",
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
      ),
    );
  }
}
