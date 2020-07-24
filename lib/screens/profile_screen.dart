import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFFFBC02D),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Color(0xFFFBC02D),
                    size: 33,
                  ),
                  onPressed: null,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Material(
                color: Color(0xFFFBC02D),
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed: null,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/maktabtmisr.png',
                              height: 140,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 105.0, top: 115),
                          child: Material(
                            borderRadius: BorderRadius.circular(50.0),
                            elevation: 1.5,
                            child: IconButton(
                              iconSize: 28,
                              icon: Icon(
                                Icons.photo_camera,
                                color: Color(0xFFFBC02D),
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Maktabt Misr",
                    style: TextStyle(color: Color(0xFF575A89), fontSize: 28),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 56,
                            color: Color(0xFFFBC02D),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/book3.png",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Uploaded",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 56,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/heart.png",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 120,
                                  child: Text(
                                    "50 Likes",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFFFBC02D), fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xFFFBC02D),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "ali@gmail.com",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF575A89),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "phone",
                          style: TextStyle(
                            color: Color(0xFFFBC02D),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "55555555555555",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF575A89),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "Governorate",
                          style: TextStyle(
                            color: Color(0xFFFBC02D),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "Sharkia",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF575A89),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
