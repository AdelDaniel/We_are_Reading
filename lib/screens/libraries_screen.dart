import 'package:flutter/material.dart';

import '../widgets/libraries_widget.dart';

class LibrariesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .85,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (ctx, i) => LibrariesWidget(),
    );
  }
}









//    return Card(
//      margin: EdgeInsets.only(top: 10,bottom: 5,left: 5,right: 5),
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(30),
//      ),
//      child: GridView.builder(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2,
//          crossAxisSpacing: 10,
//          mainAxisSpacing: 10,
//          childAspectRatio: .9,
//        ),
//        itemCount: 4,
//        itemBuilder: (context, i) =>
//            LibrariesWidget(
////                  item1.requestsItems[i].requestLibraryName,
////                  item1.requestsItems[i].requestId,
////                  item1.requestsItems[i].requestBookName,
////                  item1.requestsItems[i].requestImage,
////                  item1.requestsItems[i].requestBookAuther,
//
//            ),
//
//      ),
//    );
//  }
//}
