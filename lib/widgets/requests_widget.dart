import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_simulator/device_simulator.dart';

import '../screens/borrowed_screen.dart';
import '../screens/approved_requests_screen.dart';
import '../screens/requests_internal_screen.dart';

class RequestsItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      allowFontScaling: true,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );

    return ListView(
      children:<Widget>[
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return BorrowedScreen();
                  // print();
                }));
          } ,
          child: Card(

            margin: EdgeInsets.only(left: 15,right: 15,top: 10,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/borrowed.png',
                  fit: BoxFit.cover,
                ),

                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Borrowed Books',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Color.fromRGBO(63, 61, 86, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return InternalRequests();
                }));
          },
          child: Card(
            margin: EdgeInsets.only(left: 15,right:15,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/requests.png',
                  fit: BoxFit.cover,
                ),

                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Requested Books',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Color.fromRGBO(63, 61, 86, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ApprovedRequests();
                }));
          } ,
          child: Card(
            margin: EdgeInsets.only(left: 15,right: 15,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/accepted.png',
                  fit: BoxFit.cover,
                ),

                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Accepted Requests',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Color.fromRGBO(63, 61, 86, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}