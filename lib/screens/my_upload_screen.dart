import 'package:flutter/material.dart';

import './add_book_screen.dart';
import '../widgets/my_upload_widget.dart';

class MyUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, i) => MyUploadWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
//        onPressed: (){},
        elevation: 5,
        backgroundColor: Colors.blue,
        child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddBookScreen.routeName)),
      ),
    );
  }
}
