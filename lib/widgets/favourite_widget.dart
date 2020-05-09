import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/After_Request_From_Lib_Screen.dart';



class FavouriteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    ScreenUtil.init(
      context,
      allowFontScaling: true,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
    );

    return   Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(5)),
                width: ScreenUtil().setWidth(183),
                //height: ScreenUtil().setHeight(250),
                //color: Colors.deepPurple,
                child: Stack(
                  children: <Widget>[
                    //image container
                    Container(
                        width: double.infinity,
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/ar/9/92/%D8%A7%D9%84%D8%B7%D9%86%D8%B7%D9%88%D8%B1%D9%8A%D8%A9.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                        )),

                    Positioned(
                      width: ScreenUtil().setWidth(183),
                      bottom: 0,
                      right: 0,
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, .8),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: null),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'الطنطورية',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(15,
                                          allowFontScalingSelf:
                                          true)),
                                ),
                                Text(
                                  'رضوى عاشور',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(15,
                                          allowFontScalingSelf:
                                          true)),
                                ),
                                Text(
                                  'عدد النسخ : 5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(15,
                                          allowFontScalingSelf:
                                          true)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: ScreenUtil()
                            .setSp(12, allowFontScalingSelf: true),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Color.fromRGBO(63, 61, 86, 1),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(5),
                ),
                Flexible(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(afterborrowScreen.routeName);
                    },
                    child: Text(
                      'Borrow',
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Color.fromRGBO(251, 192, 45, 1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}





//    ScreenUtil.init(
//      context,
//      allowFontScaling: true,
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
//    );
//
//    return Container(
//      height: MediaQuery.of(context).size.height,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Flexible(
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(30),
//              child: Container(
//                margin: EdgeInsets.only(
//                    bottom: ScreenUtil().setHeight(5)),
//                width: ScreenUtil().setWidth(183),
//                //height: ScreenUtil().setHeight(250),
//                //color: Colors.deepPurple,
//                child: Stack(
//                  children: <Widget>[
//                    //image container
//                    Container(
//                        width: double.infinity,
//                        child: Image.network(
//                          'https://upload.wikimedia.org/wikipedia/ar/9/92/%D8%A7%D9%84%D8%B7%D9%86%D8%B7%D9%88%D8%B1%D9%8A%D8%A9.jpg',
//
//                          fit: BoxFit.fill,
//                          height: double.infinity,
//                        )),
//
//                    Positioned(
//                      width: ScreenUtil().setWidth(183),
//                      bottom: 0,
//                      right: 0,
//                      child: Container(
//                        color: Color.fromRGBO(255, 255, 255, .8),
//                        child:
////                        Row(
////                          crossAxisAlignment:
////                          CrossAxisAlignment.center,
////                          mainAxisAlignment:
////                          MainAxisAlignment.spaceBetween,
////                          children: <Widget>[
////                            IconButton(
////                                icon: Icon(Icons.favorite_border,size: 45,),
////                                onPressed: (){}),
//                            Column(
//                              crossAxisAlignment:
//                              CrossAxisAlignment.center,
//                              children: <Widget>[
//                               // Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
//                                 // child:
//                                  Text(
//                                    'الطنطورية',textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: ScreenUtil().setSp(15,
//                                            allowFontScalingSelf:
//                                            true)),
//                                  ),
//                                // ),
////                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
////                                  child:
//                                  Text(
//                                    'رضوى عاشور', textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: ScreenUtil().setSp(15,
//                                            allowFontScalingSelf:
//                                            true)),
//                                  ),
//                               // ),
////                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
////                                  //  padding: const EdgeInsets.all(8.0),
////                                  child:
//                                  Padding(
//                                    padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(3)),
//                                    child: Text(
//                                      'Maktabit Masr',  textAlign: TextAlign.center,
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: ScreenUtil().setSp(15,
//                                              allowFontScalingSelf:
//                                              true)),
//                                    ),
//                                  ),
//                               // ),
//                              ],
//                            ),
////                          ],
////                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
////           Padding(padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(2))),
////          Container(
////            height: ScreenUtil().setHeight(40),
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.center,
////              children: <Widget>[
////                Flexible(
////                  child: RaisedButton(
////                    onPressed: () {},
////                    child: Text(
////                      'Reviews',
////                      style: TextStyle(
////                        fontSize: ScreenUtil()
////                            .setSp(12, allowFontScalingSelf: true),
////                        color: Color.fromRGBO(255, 255, 255, 1),
////                      ),
////                    ),
////                    shape: RoundedRectangleBorder(
////                      borderRadius: BorderRadius.circular(40),
////                    ),
////                    color: Color.fromRGBO(63, 61, 86, 1),
////                  ),
////                ),
////                SizedBox(
////                  width: ScreenUtil().setWidth(5),
////                ),
////                Flexible(
////                  child: RaisedButton(
////                    onPressed: () {},
////                    child: Text(
////                      'Borrow',
////                      style: TextStyle(
////                          fontSize: ScreenUtil()
////                              .setSp(12, allowFontScalingSelf: true),
////                          color: Color.fromRGBO(255, 255, 255, 1)),
////                    ),
////                    shape: RoundedRectangleBorder(
////                      borderRadius: BorderRadius.circular(40),
////                    ),
////                    color: Color.fromRGBO(251, 192, 45, 1),
////                  ),
////                ),
////              ],
////            ),
////          ),
//          Padding(padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(2))),
//        ],
//      ),
//    ) ;
//  }
//}




//    return Container(
//      //height: 400,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(40),
//      ),
//      //margin: EdgeInsets.all(10),
//      //padding: EdgeInsets.only(left: 10,right: 10,),
////      shape: RoundedRectangleBorder(
////        borderRadius: BorderRadius.circular(30),
////      ),
//      child:
//      ClipRRect(
//        borderRadius: BorderRadius.circular(30),
//        child:
//        GridTile(
//          child: GestureDetector(
//            child: AspectRatio(
//              aspectRatio: 2 / 2,
//              child: Image.asset(
//                'assets/images/pic1.png',
//                fit: BoxFit.cover,
//              ),
//            ),
//          ),
//          footer: AspectRatio(
//            aspectRatio: 2.2 / 1,
//            child: GridTileBar(
//              backgroundColor: Color.fromRGBO(255, 255, 255, .8),
//              title: Column(
//                //mainAxisAlignment: MainAxisAlignment.center,
//                //crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text(
//                    'دقات الشامو',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                      color: Color.fromRGBO(63, 61, 86, 1),
//                    ),
//                  ),
//                  Text(
//                    'عمرو عبدالحميد',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                      color: Color.fromRGBO(63, 61, 86, 1),
//                    ),
//                  ),
//                  Text(
//                    'maktabt Masr',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                      color: Color.fromRGBO(63,61,86,1),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),),
//    );
//  }
//}
