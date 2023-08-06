import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
                imageUrl:
                    "https://helios-i.mashable.com/imagery/articles/02KyEAwYxVujZac4DvG3qQg/hero-image.fill.size_1248x702.v1623367870.jpg"),
          );
        },
      ),
    );
  }
}
