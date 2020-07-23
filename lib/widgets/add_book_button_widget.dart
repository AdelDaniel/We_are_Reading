import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Function onPressed;

  String buttonName;

  double width, height, horizontal, vertical;
  Color color;

  Buttons({
    this.onPressed,
    this.buttonName,
    this.width = 200,
    this.height = 50,
    this.vertical = 9.0,
    this.horizontal = 30,
    this.color = const Color.fromRGBO(251, 192, 45, 1),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: MaterialButton(
        height: height,
        minWidth: width,
        elevation: 5.0,
        color: color,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        onPressed: onPressed,
        child: Text(
          buttonName,
        ),
      ),
    );
  }
}
