import 'package:flutter/foundation.dart';

import '../models/book_data.dart';

class BookProvider extends ChangeNotifier {
  List<BookData> _bookItems=[
    BookData(
        bookId: 'B1',
      autherName: 'رضوى عاشور' ,
      bookImage: 'assets/images/pic.png',
      bookName: 'الطنطوريه',
      copies: 5,
      libName: 'Maktabt Masr',
    ownerName: 'ahmed saad',
    ),
    BookData(
      bookId: 'B2',
      autherName: 'عمرو عبدالحميد' ,
      bookImage: 'assets/images/pic1.png',
      bookName: 'دقات الشامو',
      copies: 5,
      libName: 'Maktabt Masr',
      ownerName: 'ahmed saad',
    ),
    BookData(
      bookId: 'B3',
      autherName: 'عمرو عبدالحميد' ,
      bookImage: 'assets/images/pic1.png',
      bookName: 'دقات الشامو',
      copies: 5,
      libName: 'Maktabt Masr',
      ownerName: 'ahmed saad',
    ),
    BookData(
      bookId: 'B4',
      autherName: 'رضوى عاشور' ,
      bookImage: 'assets/images/pic.png',
      bookName: 'الطنطوريه',
      copies: 5,
      libName: 'Maktabt Masr',
      ownerName: 'ahmed saad',
    ),
  ];

  List<BookData> get bookItems => [..._bookItems];

}