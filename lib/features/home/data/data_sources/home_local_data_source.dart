import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0});

  List<BookEntity> fetchNewestBooks({int pageNum = 0});
  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
