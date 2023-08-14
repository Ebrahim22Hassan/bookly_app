import 'package:hive/hive.dart';

/// add this
part 'book_entity.g.dart';

/// then Run this command "flutter packages pub run build_runner build"

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? rating;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.rating,
      required this.bookId});
}
