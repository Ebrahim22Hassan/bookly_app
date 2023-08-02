import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding30),
      child: Column(
        children: const [
          CustomBookDetailsAppBar(),
        ],
      ),
    );
  }
}
