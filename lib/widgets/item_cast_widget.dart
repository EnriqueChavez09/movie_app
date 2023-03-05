import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';

class ItemCastWidget extends StatelessWidget {
  CastModel cast;
  ItemCastWidget({
    required this.cast,
  });
  final String _baseUrlImage = Environment.apiUrlImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      margin: const EdgeInsets.only(
        right: 14.0,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            radius: 44.0,
            backgroundImage: cast.profilePath!.isNotEmpty
                ? NetworkImage(
                    "$_baseUrlImage${cast.profilePath}",
                  )
                : const NetworkImage(
                    "https://st4.depositphotos.com/4329009/19956/v/450/depositphotos_199564354-stock-illustration-creative-vector-illustration-of-default.jpg"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            cast.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
