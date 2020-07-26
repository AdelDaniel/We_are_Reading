import 'package:flutter/material.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/screens/login_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with AlertsMixin {

  bool filter = false;
  List<bool> checkValGovernorate = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  List<bool> checkValCategories = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  List<bool> checkValBookOwner = [true, true];
  List<String> governorates = [
    "Cairo",
    "Luxor",
    "Giza",
    "Sharkia",
    "Dakahlia",
    "Aswan",
    "Tanta"
  ];
  List<String> categories = [
    "history",
    "science",
    "religon",
    "Literature",
    "poetry",
    "a",
    "b",
    "c",
    "c",
    "c",
    "c",
    "c"
  ];
  List<String> bookOwner = ["Libray", "Readers"];
  List<String> chosenGovernorates = [];
  List<String> chosenCategories = [];
  List<String> chosenBookOwner = [];

  checkGovernorateOnChanged(int idx, bool val) {
    setState(() {
      checkValGovernorate[idx] = val;
//      val ? chosenGovernorates.add(governorates[idx]) : chosenGovernorates.removeAt(idx);
    });
  }

  checkCategoriesOnChanged(int idx, bool val) {
    setState(() {
      checkValCategories[idx] = val;
//      val ? chosenCategories.add(categories[idx]) : chosenCategories.removeAt(idx);
    });
  }

  checkBookOwnerOnChanged(int idx, bool val) {
    setState(() {
      checkValBookOwner[idx] = val;
//      val ? chosenBookOwner.add(bookOwner[idx]) : chosenBookOwner.removeAt(idx);
    });
  }

  Future<void> _logout() async {
    try {
      await Provider.of<Auth>(context, listen: false).logout();
      showSuccessDialog(context, 'logged out successfully');
    } on HttpException catch (e) {
      showErrorDialog(context, e.toString());
    } catch (e) {
      throw e;
    }
  }
  Auth _authReference ;

  @override
  void didChangeDependencies() {
    _authReference = Provider.of<Auth>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return filter == false
        ? Drawer(
            child: Container(
              color: Color.fromRGBO(46, 43, 72, 1),
              child: Column(
                children: <Widget>[
                  AppBar(
                    centerTitle: true,
                    backgroundColor: Color.fromRGBO(63, 61, 86, 1),
                    leading: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 45,
                        color: Color.fromRGBO(251, 192, 45, 1),
                      ),
                    ),
                    title: Text(
                      'Drawer',
                      style: TextStyle(
                        color: Color.fromRGBO(251, 192, 45, 1),
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Chats',
                      style: TextStyle(
                        color: Color.fromRGBO(251, 192, 45, 1),
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(251, 192, 45, 1),
                    thickness: 1,
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        setState(() {
                          filter = true;
                        });
                      },
                      child: Text(
                        'Filter Books',
                        style: TextStyle(
                          color: Color.fromRGBO(251, 192, 45, 1),
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(251, 192, 45, 1),
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () async {
                      if(_authReference.isAuth) {
                        final xx = (await showConfirmDialog(
                            context,
                            null,
                            'Log out',
                            'Are you sure you want to logout?', [
                          'Cancel',
                          'Log out'
                        ])) ??
                            false;
                        if (xx) _logout();
                      }
                      else
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
                    },
                    trailing: IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          size: 35,
                          color: Color.fromRGBO(251, 192, 45, 1),
                        ),
                        onPressed: () {}),
                    title: Text(
                      _authReference.isAuth ? 'Log Out' : 'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(251, 192, 45, 1),
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(251, 192, 45, 1),
                    thickness: 1,
                  ),
                ],
              ),
            ),
          )
        : Drawer(
            child: Container(
              color: Color.fromRGBO(46, 43, 72, 1),
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Color.fromRGBO(63, 61, 86, 1),
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Color.fromRGBO(251, 192, 45, 1),
                      ),
                      onPressed: () => {
                        super.setState(() {
                          filter = false;
                        })
                      },
                    ),
                    title: Text(
                      'Filter books',
                      style: TextStyle(color: Color(0xFFFBC02D), fontSize: 23),
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        width: 37,
                        height: 117,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBC02D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Image.asset('assets/images/bank.png'),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 5),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 14.0, bottom: 10),
                              child: Text(
                                "Governorates",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 17),
                              ),
                            ),
                            Container(
                              height: 80,
                              child: ListView.builder(
                                  itemCount: governorates.length,
                                  itemBuilder: (context, idx) {
                                    return checkBoxBuilder(
                                        idx,
                                        checkValGovernorate[idx],
                                        governorates[idx],
                                        checkGovernorateOnChanged);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        width: 37,
                        height: 195,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBC02D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Image.asset('assets/images/greenhouse.png'),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 5),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 14.0, bottom: 10),
                              child: Text(
                                "Categories",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 17),
                              ),
                            ),
                            Container(
                              height: 150,
                              child: ListView.builder(
                                  itemCount: categories.length,
                                  itemBuilder: (context, idx) {
                                    return checkBoxBuilder(
                                        idx,
                                        checkValCategories[idx],
                                        categories[idx],
                                        checkCategoriesOnChanged);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        width: 37,
                        height: 98,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBC02D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Image.asset('assets/images/study.png'),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 5),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 14.0, bottom: 10),
                            child: Text(
                              "Book Owner",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 17),
                            ),
                          ),
                          checkBoxBuilder(0, checkValBookOwner[0], "Library",
                              checkBookOwnerOnChanged),
                          checkBoxBuilder(1, checkValBookOwner[1], "Readers",
                              checkBookOwnerOnChanged),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  Container(
                    width: 140,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xfffac02e)),
                    child: FlatButton(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        //NAVIGATION SECTION + Chosen filters
                        for (int i = 0; i < governorates.length; ++i) {
                          setState(() {
                            checkValGovernorate[i]
                                ? chosenGovernorates.add(governorates[i])
                                : null;
                          });
                        }
                        for (int i = 0; i < categories.length; ++i) {
                          setState(() {
                            checkValCategories[i]
                                ? chosenCategories.add(categories[i])
                                : null;
                          });
                        }
                        for (int i = 0; i < bookOwner.length; ++i) {
                          setState(() {
                            checkValBookOwner[i]
                                ? chosenBookOwner.add(bookOwner[i])
                                : null;
                          });
                        }
                        print(''' 
                    $chosenGovernorates
                    $chosenCategories
                    $chosenBookOwner
                    ''');
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

Widget checkBoxBuilder(int idx, bool val, String text, Function onChanged) {
  return Container(
    height: 30,
    child: Row(
      children: <Widget>[
        Container(
          child: Checkbox(
            value: val,
            onChanged: (val) {
              onChanged(idx, val);
            },
            activeColor: Color(0xFFFBC02D),
          ),
        ),
        Text(
          "$text",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ],
    ),
  );
}
