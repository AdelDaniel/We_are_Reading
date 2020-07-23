import 'package:flutter/material.dart';

import '../models/requests_data.dart';

class RequestsProvider extends ChangeNotifier{
  List<RequestsDate> _requestsItems =[
    RequestsDate(
      requestBookAuther: 'رضوى عاشور',
      requestBookName: 'الطنطوريه' ,
      requestId: 'a1',
      requestImage: 'asseta/images/pic.png',
      requestLibraryName: 'Maktabt Masr',
    ),
    RequestsDate(
      requestBookAuther: ' عمرو عبدالحميد',
      requestBookName: 'دقات الشامو' ,
      requestId: 'a2',
      requestImage: 'asseta/images/pic1.png',
      requestLibraryName: 'Maktabt Masr',
    ),
  ];

  List<RequestsDate> get requestsItems => [..._requestsItems];
}