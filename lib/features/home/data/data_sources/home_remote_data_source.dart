import 'package:bookly/constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books.dart';
import '../../domain/entities/book_entity.dart';
import '../models/BookModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');

    List<BookEntity> books = getBooksList(data);
    saveBooksData(book: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(book: books, boxName: kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(book: books, boxName: kSimilarBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
