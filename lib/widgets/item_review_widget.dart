import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';

class ItemReviewWidget extends StatelessWidget {
  ReviewModel review;
  ItemReviewWidget({
    required this.review,
  });
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: CustomColors.tertiaryColor,
      collapsedIconColor: CustomColors.primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      tilePadding: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: CustomColors.primaryColor.withOpacity(0.1),
            child: Text(
              review.authorDetails.rating.toString(),
              style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.author,
                style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                DateFormat("dd-MM-yyyy").format(review.createdAt),
                style: TextStyle(
                  color: CustomColors.primaryColor.withOpacity(0.6),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      children: [
        Text(
          review.content,
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
