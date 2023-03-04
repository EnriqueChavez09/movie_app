import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final MovieArgumentModel movieArgument =
        ModalRoute.of(context)!.settings.arguments as MovieArgumentModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/portada.jpg",
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
                              text: "7.235",
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
                                  text: "45342",
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.whatshot_outlined,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
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
                    "Black Panther: Wakanda Forever",
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "162 min",
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
                        "2022",
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Ipsum nisi anim ullamco Lorem nulla nostrud excepteur officia ad. Dolor mollit aute elit quis enim. Ut reprehenderit et nulla cupidatat tempor dolore sint magna irure et elit. Anim quis est exercitation excepteur reprehenderit ad id fugiat officia.",
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
