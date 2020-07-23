import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => BookItem(),
      );

  }
}
