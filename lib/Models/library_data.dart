import 'package:flutter/foundation.dart';

class LibraryData {
  final String libraryName;

  final String libraryImage;
  final String address;
  final String libraryId;
  final String bName;
  final String autName;
  final int bookCopies;
  bool isFav;

  LibraryData({
    @required this.libraryId,
    @required this.libraryName,
    @required this.libraryImage,
    @required this.address,
    @required this.autName,
    @required this.bName,
    @required this.bookCopies,
    this.isFav = false,
  });
}
