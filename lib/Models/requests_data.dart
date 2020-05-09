import 'package:flutter/foundation.dart';

class RequestsDate {
  final String requestId;
  final String requestImage;
  final String requestBookName;
  final String requestBookAuther;
  final String requestLibraryName;

  RequestsDate({
    @required this.requestId,
    @required this.requestImage,
    @required this.requestBookName,
    @required this.requestBookAuther,
    @required this.requestLibraryName,
  });
}
