import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNum = 0});

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNum = 0});

  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      [String category]);
}
