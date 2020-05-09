import 'package:flutter/material.dart';

import '../widgets/borrowed_widget.dart';

//import 'package:my_graduation_project/provider/book_provider.dart';
//import 'package:my_graduation_project/provider/requests_provider.dart';
//import 'package:provider/provider.dart';

//import '../provider/book_provider.dart';

//import '../models/book_data.dart';

class BorrowedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// final loadedBooks = Provider.of<BookProvider>(context).bookItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251,192,45,1),
       // centerTitle: true,
        title: Text(
          'Borrowed',
          style: TextStyle(
            color: Color.fromRGBO(255,255,255, 1),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, i) => BorrowedWidget(),
      ),
    );
  }
}
