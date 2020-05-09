import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ApprovedRequestsWidget extends StatelessWidget {

//  final String id;
//  final String bName;
//  final String imageName;
//  final String bAuther;
//  final String libName;
//  ApprovedRequestsWidget({
//    this.libName,
//    this.id,
//    this.bName,
//    this.imageName,
//    this.bAuther,
//  });

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

    return Container(
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
          //SizedBox(
          //                            width: ScreenUtil().setWidth(5),
          //  SizedBox(),
          Container(
            height: ScreenUtil().setHeight(40),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                'Cancel Request',
                style: TextStyle(
                  fontSize: ScreenUtil()
                      .setSp(12, allowFontScalingSelf: true),
                  color: Color.fromRGBO(211, 47, 47, 1),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),

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
//      padding: EdgeInsets.all(10),
//      height: MediaQuery.of(context).size.height,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Flexible(
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(30),
//              child: Container(
//                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
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
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            // Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
//                            // child:
//                            Text(
//                              'الطنطورية',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: ScreenUtil()
//                                      .setSp(15, allowFontScalingSelf: true)),
//                            ),
//                            // ),
////                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
////                                  child:
//                            Text(
//                              'رضوى عاشور',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: ScreenUtil()
//                                      .setSp(15, allowFontScalingSelf: true)),
//                            ),
//                            // ),
////                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(12)),
////                                  //  padding: const EdgeInsets.all(8.0),
////                                  child:
//                            Padding(
//                              padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(3)),
//                              child: Text(
//                                'Maktabit Masr',
//                                textAlign: TextAlign.center,
//                                style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: ScreenUtil()
//                                        .setSp(15, allowFontScalingSelf: true)),
//                              ),
//                            ),
//                            // ),
//                          ],
//                        ),
////                          ],
////                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//         //  Padding(padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(5))),
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
//
//          Container(
//                  child: RaisedButton(
//                    onPressed: () {},
//                    child: Text(
//                      'Cancel Request',
//                      style: TextStyle(
//                        fontSize: ScreenUtil()
//                            .setSp(12, allowFontScalingSelf: true),
//                        color: Color.fromRGBO(211, 47, 47, 1),
//                      ),
//                    ),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(40),
//                    ),
//                    color: Color.fromRGBO(255, 255, 255, 1),
//                  ),
//                ),
//
////          Container(
////            height: ScreenUtil().setHeight(30),
////            child: RaisedButton(
////              onPressed: () {},
////              child: Text(
////                'Cancel Request',
////                style: TextStyle(
////                  color: Color.fromRGBO(211, 47, 47, 1),
////                ),
////              ),
////              shape: RoundedRectangleBorder(
////                borderRadius: BorderRadius.circular(30),
////              ),
////              color: Color.fromRGBO(255, 255, 255, 1),
////            ),
////          ),
//          Padding(padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(3))),
//        ],
//      ),
//    );
//
//
//
//
//
////    return Column(
////      children: <Widget>[
////        Container(
////          height: 170,
////          child: ClipRRect(
////            borderRadius: BorderRadius.circular(20),
////            child:  GridTile(
////              child: GestureDetector(
////                child: AspectRatio(
////                  aspectRatio: 1/2,
////                  child: Image.network(
////                    'assets/images/pic1.png',
////                    fit: BoxFit.cover,
////                  ),
////                ),
////              ),
////              footer: AspectRatio(
////                aspectRatio:  2.4/1,
////                child: GridTileBar(
////                  backgroundColor: Color.fromRGBO(255,255,255,.8),
//////                  leading: IconButton(
//////                      icon: Icon(Icons.favorite,size: 35,color: Color.fromRGBO(139,139,139,1),),
//////                      onPressed: (){}),
////                  title: Column(
////                    mainAxisAlignment: MainAxisAlignment.start,
////                    crossAxisAlignment: CrossAxisAlignment.end,
////                    children: <Widget>[
////                      Text('دقات الشامو',textAlign: TextAlign.right,style: TextStyle(color: Color.fromRGBO(63,61,86, 1),),),
////                      Text('عمرو عبدالحميد',textAlign: TextAlign.right,style: TextStyle(color: Color.fromRGBO(63,61,86, 1),),),
////                      Text('Maktabt Masr',textAlign: TextAlign.right,style: TextStyle(color: Color.fromRGBO(63,61,86, 1),),),
////                    ],
////                  ),
////                ),
////              ),
////            ),
////
////          ),
////        ),
////
////        RaisedButton(
////          onPressed: () {},
////          child: Text('Cancel Request',style: TextStyle(color: Color.fromRGBO(255,255,255,1),),),
////          shape: RoundedRectangleBorder(
////            borderRadius: BorderRadius.circular(30),
////          ),
////          color:Color.fromRGBO(63,61,86,1),
////        ),
////
////      ],
////    );
//  }
//}
