import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/models/models.dart';

class ItemCategoryWidget extends StatelessWidget {
  GenreModel genre;
  bool isSelected;
  void Function()? onTap;
  ItemCategoryWidget({
    required this.genre,
    this.onTap,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            Text(
              genre.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? CustomColors.primaryColor
                    : CustomColors.primaryColor.withOpacity(
                        0.35,
                      ),
              ),
            ),
            isSelected
                ? Container(
                    width: 50.0,
                    height: 3.5,
                    color: CustomColors.tertiaryColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
