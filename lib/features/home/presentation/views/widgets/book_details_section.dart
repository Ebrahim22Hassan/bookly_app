import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating_text.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18),
          child: const CustomBookImage(
              imageUrl:
                  "https://helios-i.mashable.com/imagery/articles/02KyEAwYxVujZac4DvG3qQg/hero-image.fill.size_1248x702.v1623367870.jpg"),
        ),
        const SizedBox(
          height: 43,
        ),
        const Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            "GSD gad",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRatingText(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
