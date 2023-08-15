import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'newest_book_listview_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: NewestBooksListViewItem(
            bookEntity: books[index],
          ),
        );
      },
    );
  }
}
