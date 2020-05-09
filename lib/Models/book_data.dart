import 'package:flutter/foundation.dart';

class BookData {
  final String ownerName;
  final String autherName;
  final String bookImage;
  final String bookName;
  final String bookId;
  final String libName;
  final int copies;
  bool isFavourite;

  BookData({
    @required this.copies,
    @required this.autherName,
    @required this.bookName,
    @required this.bookImage,
    this.isFavourite = false,
    @required this.bookId,
    @required this.libName,
    @required this.ownerName,
  });
}
