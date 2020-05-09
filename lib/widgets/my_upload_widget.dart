import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyUploadWidget extends StatelessWidget {
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
                      'remove',
                      style: TextStyle(
                        fontSize: ScreenUtil()
                            .setSp(14, allowFontScalingSelf: true),
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
                    onPressed: () {},
                    child: Text(
                      'update',
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(14, allowFontScalingSelf: true),
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
