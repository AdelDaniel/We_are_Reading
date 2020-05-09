import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/After_Request_From_Lib_Screen.dart';


class BookItem extends StatelessWidget {
//  final String id;
//  final String bookName;
//  final String autherName;
//  final String bookImage;
//  final int copies;
//
//  BookItem(
//      this.id,
//      this.bookName,
//      this.autherName,
//      this.bookImage,
//      this.copies,
//      );

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
//                        child: Row(
////                          crossAxisAlignment:
////                          CrossAxisAlignment.center,
//                          mainAxisAlignment:
//                          MainAxisAlignment.spaceAround,
//                          children: <Widget>[
//                            IconButton(
//                                icon: Icon(Icons.favorite_border,size: 35,),
//                                onPressed: (){}),
//                            Column(
//                              crossAxisAlignment:
//                              CrossAxisAlignment.end,
//                              children: <Widget>[
//                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(6)),
//                                  child: Text(
//                                    'الطنطورية',textAlign: TextAlign.right,
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: ScreenUtil().setSp(15,
//                                            allowFontScalingSelf:
//                                            true)),
//                                  ),
//                                ),
//                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(6)),
//                                  child: Text(
//                                    'رضوى عاشور', textAlign: TextAlign.right,
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: ScreenUtil().setSp(15,
//                                            allowFontScalingSelf:
//                                            true)),
//                                  ),
//                                ),
//                                Padding( padding: EdgeInsets.only(right:  ScreenUtil().setWidth(6)),
//                                //  padding: const EdgeInsets.all(8.0),
//                                  child: Text(
//                                    'عدد النسخ : 5',  textAlign: TextAlign.right,
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: ScreenUtil().setSp(15,
//                                            allowFontScalingSelf:
//                                            true)),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
////           Padding(padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(2))),
//          Container(
//            height: ScreenUtil().setHeight(40),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Flexible(
//                  child: RaisedButton(
//                    onPressed: () {},
//                    child: Text(
//                      'Reviews',
//                      style: TextStyle(
//                        fontSize: ScreenUtil()
//                            .setSp(12, allowFontScalingSelf: true),
//                        color: Color.fromRGBO(255, 255, 255, 1),
//                      ),
//                    ),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(40),
//                    ),
//                    color: Color.fromRGBO(63, 61, 86, 1),
//                  ),
//                ),
//                SizedBox(
//                  width: ScreenUtil().setWidth(5),
//                ),
//                Flexible(
//                  child: RaisedButton(
//                    onPressed: () {},
//                    child: Text(
//                      'Borrow',
//                      style: TextStyle(
//                          fontSize: ScreenUtil()
//                              .setSp(12, allowFontScalingSelf: true),
//                          color: Color.fromRGBO(255, 255, 255, 1)),
//                    ),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(40),
//                    ),
//                    color: Color.fromRGBO(251, 192, 45, 1),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Padding(padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(5))),
//        ],
//      ),
//    ) ;

















//    Column(
//      children: <Widget>[
//        Container(
//          height: 190,
//          child: ClipRRect(
//            borderRadius: BorderRadius.circular(20),
//            child:  GridTile(
//              child: GestureDetector(
//                child: AspectRatio(
//                  aspectRatio: 1/1,
//                  child: Image.asset(
//                    bookImage,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//              ),
//              footer: AspectRatio(
//                aspectRatio: 2.8/1,
//                child: GridTileBar(
//                  backgroundColor: Color.fromRGBO(255,255,255,.8),
//                  leading: IconButton(
//                      icon: Icon(Icons.favorite,size: 30,color: Color.fromRGBO(139,139,139,1),),
//                      onPressed: (){}),
//                  title: Column(
//                    //mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      Text(bookName,
//                        textAlign: TextAlign.right,
//                        style: TextStyle(color: Color.fromRGBO(63,61,86, 1),),),
//                      Text(autherName,
//                        textAlign: TextAlign.right,
//                        style: TextStyle(color: Color.fromRGBO(63,61,86, 1),),),
//                      // Text('عدد النسخ : 5',textAlign: TextAlign.right,),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//
//          ),
//        ),
//        FittedBox(
//          child: Row(
//            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            // crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              RaisedButton(
//                onPressed: () {},
//                child: Text('Borrow',style: TextStyle(color: Color.fromRGBO(255,255,255,1),),),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(40),
//                ),
//                color: Color.fromRGBO(251,192,45, 1),
//              ),
//              Padding(padding: EdgeInsets.only(left: 3,right: 3)),
//              RaisedButton(
//                onPressed: () {},
//                child: Text('Reviews',style: TextStyle(color: Color.fromRGBO(255,255,255,1),),),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(40),
//                ),
//                color:Color.fromRGBO(63,61,86,1),
//              ),
//            ],
//            // mainAxisAlignment: MainAxisAlignment.spaceAround,
//          ),
//        )
//      ],
//    )






//
//
//    Column(
//
//      children:<Widget> [Container(
//        height:200,
//        child: ClipRRect(
//            borderRadius: BorderRadius.circular(30),
////      child: FittedBox(
//              child: GridTile(
//                child: AspectRatio(
//                  aspectRatio: 1/1,
//                  child: Image.asset(
//                    bookImage,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                footer:  AspectRatio(
//                  aspectRatio: 2.2/1,
////          child: Container(
//                   // margin: EdgeInsets.only(left: 9,right: 9,),
////            decoration: BoxDecoration(
////              borderRadius: BorderRadius.circular(100),
////            ),
////            child: FittedBox(
//                    //  fit: BoxFit.contain,
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
//                        child: GridTileBar(
//
//                            backgroundColor: Colors.black87, //fromRGBO(255, 255, 255, .8)
//                            leading: IconButton(
//                                icon: Icon(
//                                  Icons.favorite,
//                                  size: 40,
//                                  color: Color.fromRGBO(139, 139, 139, 1),
//                                ),
//                                onPressed: () {}),
//                            trailing: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.end,
//                             // textBaseline: TextBaseline.alphabetic,
//                              children: <Widget>[
//                                Text(
//                                  bookName,
//                                  style: TextStyle(color: Color.fromRGBO(63,61,86,1),),
//                                  textAlign: TextAlign.right,
//                                //  textDirection: TextDirection.rtl,
//                                ),
//                                Text(
//                                  autherName,
//                                  style: TextStyle(color: Color.fromRGBO(63,61,86,1),),
//                                  textAlign: TextAlign.right,
//                                 // textDirection: TextDirection.rtl,
//                                ),
////                                Text(
////                                  '   عدد النسخ :$copies',
////                                 style: TextStyle(color: Color.fromRGBO(63,61,86,1),),
////                                 textAlign: TextAlign.right,
////                                 // textDirection: TextDirection.rtl,
////                                ),
//                              ],
//                            ),
//                          ),
//                      ),
////            ),
////          ),
//                ),
//
//              ),
////      ),
//
//        ),
//      ),
//      Row(
//        children: <Widget>[
//          RaisedButton(onPressed: (){},child: Text('Borrow',),shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15),
//          ),),
//          RaisedButton(onPressed: (){},child: Text('Review',),shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15),
//          ),),
//        ],
//      )
//      ],
//    )
//    ;

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: books(),
    );
  }
}

class books extends StatefulWidget {
  @override
  _booksState createState() => _booksState();
}

class _booksState extends State<books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: GridView.builder(padding: EdgeInsets.all(5),
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        child: GestureDetector(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/ar/9/92/%D8%A7%D9%84%D8%B7%D9%86%D8%B7%D9%88%D8%B1%D9%8A%D8%A9.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        footer: GridTileBar(
                          backgroundColor: Colors.black87,
                          leading: IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: null),
                          title: Column(
                            children: <Widget>[
                              Text('الطنطورية'),
                              Text('رضوى عاشور'),
                              //Text('عدد النسخ المتاحه : 5'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text('Borrow'),
                        color: Color.fromRGBO(63, 61, 86, 1),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('Borrow'),
                        color: Colors.indigo,
                      ),
                    ],
                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  )
                ],
              )),
    );
  }
}

 */



/*
Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children:<Widget>[ Stack(
          children: <Widget>[
            Image.asset('bookImage',fit: BoxFit.cover,),

          ],
        ),
         Row(
           children: <Widget>[
             RaisedButton(onPressed: (){},child: Text('ahmed saad'),),
             Padding(padding: EdgeInsets.all(5)),
             RaisedButton(onPressed: (){},child: Text('ahmed saad'),),
           ],
         )
        ],
      ),
    )
 */


/*
ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: Image.asset(
          bookImage,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: Color.fromRGBO(139, 139, 139, 1),
              ),
              onPressed: () {}),
          title: Column(
            children: <Widget>[
              Text(
                bookName,
                textAlign: TextAlign.right,
              ),
              Text(
                autherName,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    )
 */


























/*
ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: Image.asset(
          bookImage,
          fit: BoxFit.cover,
        ),
        footer:
           GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Color.fromRGBO(139, 139, 139, 1),
                ),
                onPressed: () {}),
            title: Column(
              children: <Widget>[
                Text(
                  bookName,
                  textAlign: TextAlign.right,
                ),
                Text(
                  autherName,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),

      ),
    )
 */
