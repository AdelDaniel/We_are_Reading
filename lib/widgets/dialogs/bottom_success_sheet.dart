import 'package:flutter/material.dart';

import '../custom_form_widgets.dart';

class SuccessBottomSheet extends StatelessWidget {
  final String message;
  final String title;

  const SuccessBottomSheet({Key key, this.message, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x29000000),
                        blurRadius: 6.0,
                        offset: Offset(0.0, 3.0))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/done.png'),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      title ?? 'Done',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Text(
                            message ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF596064),
                                fontSize: 14.0,
                                height: 1.5),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: MyCustomFormButton(
                            onPressedEvent: () {
                              Navigator.pop(context);
                            },
                            buttonText: 'Done',
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -5.0,
                    child: CustomPaint(
                      child: Container(
                        width: 35.0,
                        height: 14.0,
                      ),
                      painter: TrianglePainter(
                          strokeWidth: 10,
                          paintingStyle: PaintingStyle.fill,
                          strokeColor: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 5.0,
          left: 5.0,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x / 2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
