import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: const [
          Expanded(
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
                text: "Free Preview",
                fontSize: 16,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                backgroundColor: Color(0xffef8262),
                textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
