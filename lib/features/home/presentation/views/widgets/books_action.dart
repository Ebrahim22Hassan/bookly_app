import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/functions/launch_url.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
                text: "19.99",
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
                backgroundColor: Colors.white,
                textColor: Colors.black),
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {
                  lunchCustomUrl(context, bookModel.saleInfo!.buyLink);
                },
                text: bookModel.saleInfo!.buyLink == null
                    ? "Not Available"
                    : "Preview",
                fontSize: 16,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                backgroundColor: const Color(0xffef8262),
                textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
