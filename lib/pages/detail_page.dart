import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final MovieArgumentModel movieArgument =
        ModalRoute.of(context)!.settings.arguments as MovieArgumentModel;
    return _detailPage(
      movieArgument: movieArgument,
      height: height,
    );
  }
}

class _detailPage extends StatefulWidget {
  MovieArgumentModel movieArgument;
  double height;
  _detailPage({
    required this.movieArgument,
    required this.height,
  });

  @override
  State<_detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<_detailPage> {
  MovieDetailModel? movieDetailModel;
  List<CastModel> listCastsModel = [];
  List<BackdropModel> listBackdropsModel = [];
  List<ReviewModel> listReviewsModel = [];
  final String _baseUrlImage = Environment.apiUrlImage;

  getData() async {
    ApiService apiService = ApiService();
    int id = widget.movieArgument.id!;
    movieDetailModel = await apiService.getMovie(id);
    listCastsModel = await apiService.getCasts(id);
    listBackdropsModel = await apiService.getBackdrops(id);
    listReviewsModel = await apiService.getReviews(id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movieDetailModel != null
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: widget.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "$_baseUrlImage${movieDetailModel!.backdropPath}",
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                CustomColors.backgroundColor,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: CustomColors.secondaryColor,
                                  size: 16.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: movieDetailModel!.voteAverage
                                        .toString(),
                                    style: TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " | ",
                                        style: TextStyle(
                                          color: CustomColors.primaryColor,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: movieDetailModel!.voteCount
                                            .toString(),
                                        style: TextStyle(
                                          color: CustomColors.primaryColor,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Uri url = Uri.parse(
                                      "https://wa.me/51956346858?text=Hola",
                                    );
                                    launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  icon: Icon(
                                    Icons.whatshot_outlined,
                                    color: CustomColors.primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Share.share(
                                        "Película: ${movieDetailModel!.originalTitle} \nResumen: ${movieDetailModel!.overview} \nWeb:${movieDetailModel!.homepage}");
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: CustomColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          movieDetailModel!.originalTitle,
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${movieDetailModel!.runtime} min",
                              style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              movieDetailModel!.releaseDate.year.toString(),
                              style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Wrap(
                          spacing: 6.0,
                          children: [
                            ...List.generate(
                              movieDetailModel!.genres.length,
                              (index) => Chip(
                                label: Text(
                                  movieDetailModel!.genres[index].name,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          movieDetailModel!.overview,
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () {
                            Uri url = Uri.parse(movieDetailModel!.homepage);
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.amber,
                              gradient: LinearGradient(
                                colors: [
                                  CustomColors.tertiaryColor,
                                  CustomColors.quaternaryColor,
                                ],
                              ),
                            ),
                            child: Text(
                              "Homepage",
                              style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Top Cast",
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              ...List.generate(
                                listCastsModel.length,
                                (index) => ItemCastWidget(
                                  cast: listCastsModel[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Images",
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: listBackdropsModel.length >= 10
                                ? 10
                                : listBackdropsModel.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                "$_baseUrlImage${listBackdropsModel[index].filePath}",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            ...List.generate(
                              listReviewsModel.length,
                              (index) => ItemReviewWidget(
                                review: listReviewsModel[index],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
