import 'package:bookly/constants.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding30),
      child: Column(
        children: const [
          CustomTextField(),
          SizedBox(height: 16),
          Text("Search Result", style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
