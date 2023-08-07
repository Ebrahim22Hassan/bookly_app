import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/newest_book_listview_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // child: BooksListViewItem(),
          child: Text("data"),
        );
      },
    );
  }
}
