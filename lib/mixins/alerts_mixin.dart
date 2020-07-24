import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/widgets/dialogs/bottom_success_sheet.dart';

mixin AlertsMixin<T extends StatelessElement> {
//  void showErrorDialog(BuildContext context, String message) {
//    showDialog(
//      context: context,
//      builder: (ctx) => AlertDialog(
//        content: Text(message),
//        actions: <Widget>[
//          FlatButton(
//            child: Text('موافق'),
//            onPressed: () {
//              Navigator.of(ctx).pop();
//            },
//          )
//        ],
//      ),
//    );
//  }

  Future<void> showSuccessDialog(BuildContext context, String successMessage,
      [Duration duration = const Duration(milliseconds: 2000)]) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Platform.isIOS
          ? CupertinoAlertDialog(
              content: Text(successMessage),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text('Ok'),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true)
              ],
            )
          : AlertDialog(
              content: Text(successMessage),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                ),
              ],
            ),
    );
  }

  Future<void> showErrorDialog(BuildContext context, String errorMessage,
      [Duration duration = const Duration(milliseconds: 2000)]) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Platform.isIOS
          ? CupertinoAlertDialog(
              content: Text(errorMessage ?? ''),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text('Ok'),
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true)
              ],
            )
          : AlertDialog(
              content: Text(errorMessage ?? ''),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                ),
              ],
            ),
    );
  }

  Future<dynamic> showSuccessBottomSheet(
      BuildContext context, String title, String message) async {
    return await showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (BuildContext context) => SuccessBottomSheet(
        message: message,
        title: title,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0))),
      backgroundColor: Colors.transparent,
    );
  }

  Future<dynamic> showConfirmDialog(BuildContext context, Widget photo,
      String title, String text, List<String> buttonLabels,
      [bool danger = false]) async {
    final xx = (await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => Dialog(
                  insetAnimationCurve: Curves.easeOut,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: danger
                            ? Color(0x1AF26161)
                            : Theme.of(context).accentColor.withOpacity(0.5),
                        child: ListTile(
                          title: Center(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.title.copyWith(
                                    color: danger
                                        ? Color(0xFFF26161)
                                        : Theme.of(context).accentColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.title,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    buttonLabels[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(fontSize: 16.0),
                                  ),
                                ),
                                Container(
                                  width: 1.0,
                                  color: Color(0x2625364F),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text(
                                    buttonLabels[1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                            fontSize: 16.0,
                                            color: danger
                                                ? Color(0xFFF26161)
                                                : Theme.of(context)
                                                    .accentColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))) ??
        false;

    return xx;
  }

  Future<dynamic> showPaymentDialog(
      BuildContext context, Widget content) async {
    final xx = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => Dialog(
              insetAnimationCurve: Curves.easeOut,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42.0)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(minHeight: 270.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/pay.png'),
                      SizedBox(
                        height: 17.0,
                      ),
//                      Text('',
//                          style: TextStyle(
//                              fontWeight: FontWeight.w600,
//                              fontSize: 18.0,
//                              color: Colors.black)),
                      Divider(
                        height: 25.0,
                        thickness: 1.0,
                        color: Color(0x19707070),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      content,
                    ],
                  ),
                ),
              ),
            ));

    return xx;
  }

  Future<dynamic> showRatingDialog(BuildContext context, Widget content) async {
    final xx = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => Dialog(
              insetAnimationCurve: Curves.easeOut,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42.0)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 30.0, top: 25.0),
                    child: content,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ));

    return xx;
  }

  showDialogWithHeader(
      BuildContext context, String title, Widget content) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
              insetAnimationCurve: Curves.easeOut,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42.0)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(minHeight: 200.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34.0),
                                topRight: Radius.circular(34.0)),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFF7D002),
                                Color(0xFFD6BA23),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x018E420F),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.cancel, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              alignment: Alignment.center,
                              iconSize: 25.0,
                              tooltip: 'Cancel',
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 30.0, top: 25.0),
                        child: content,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  showDialogWithHeaderAndTimer(
      BuildContext context, String title, Widget content) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
              insetAnimationCurve: Curves.easeOut,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42.0)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(minHeight: 270.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34.0),
                                topRight: Radius.circular(34.0)),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFF7D002),
                                Color(0xFFD6BA23),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x018E420F),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.cancel, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              alignment: Alignment.center,
                              iconSize: 25.0,
                              tooltip: 'Cancel',
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 30.0, top: 25.0),
                        child: content,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
