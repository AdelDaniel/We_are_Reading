import 'package:flutter/material.dart';

//import 'package:my_graduation_project/provider/requests_provider.dart';
//import 'package:provider/provider.dart';

//import '../provider/book_provider.dart';
import '../widgets/approved_requests_widget.dart';

class ApprovedRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251,192,45,1),
        title: Text(
          'Approved Requests',
          style: TextStyle(
            color: Color.fromRGBO(255,255,255, 1),
          ),
        ),
        centerTitle: true,
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
        itemBuilder: (ctx, i) => ApprovedRequestsWidget(),
      ),
    );
  }
}

/*
*
//      Consumer<RequestsProvider>(
//        builder: (context,item3,child){
//          return
            Card(
              margin: EdgeInsets.only(top: 10,bottom: 5,left: 5,right: 5),
             // margin: EdgeInsets.all(5),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 3,
          ),
                itemCount: 4,
                itemBuilder: (context,i)=>ApprovedRequestsWidget(
//                id: item3.requestsItems[i].requestId,
//                bAuther:item3.requestsItems[i].requestBookAuther ,
//                bName: item3.requestsItems[i].requestBookName,
//                imageName: item3.requestsItems[i].requestImage,
//                libName: item3.requestsItems[i].requestLibraryName,
                )),
            ),

//        },
//      ),
    );
*/
