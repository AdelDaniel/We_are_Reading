import 'package:flutter/foundation.dart';

import '../models/library_data.dart';

class LibraryProvider extends ChangeNotifier {
  List<LibraryData> _libraryItems =[
    // dummy data
  ];

  List<LibraryData> get libraryItems => [..._libraryItems];

}