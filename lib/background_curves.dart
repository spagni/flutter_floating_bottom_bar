import 'package:flutter/material.dart';

class BackgroundCurves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: CustomPaint(
        painter: CurvesPainter(),
      ),
    );
  }
}

class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = Color(0XFFED8080).withOpacity(.6)
    ..strokeWidth = 8.0;

    Path opacityPath = Path();
    opacityPath.lineTo(0.0, size.height * 0.2);
    opacityPath.quadraticBezierTo(size.width * .1, size.height * .175, size.width * .15, size.height * .15);
    opacityPath.quadraticBezierTo(size.width * .2, size.height * .175, size.width * .42, size.height * .19);
    opacityPath.quadraticBezierTo(size.width * .65, size.height * .20, size.width * .65, size.height * .15);
    opacityPath.quadraticBezierTo(size.width * .83, size.height * .25, size.width, size.height * .19);

    opacityPath.lineTo(size.width, size.height * .18);
    opacityPath.lineTo(size.width, 0.0);
    opacityPath.close();

    canvas.drawPath(opacityPath, paint);

    Path path = Path();
    path.lineTo(0.0, size.height * 0.15);
    path.quadraticBezierTo(size.width * .15, size.height * .185, size.width * .27, size.height * .15);
    path.quadraticBezierTo(size.width * .40, size.height * .12, size.width * .52, size.height * .17);
    path.quadraticBezierTo(size.width * .65, size.height * .22, size.width * .8, size.height * .18);
    path.quadraticBezierTo(size.width * .9, size.height * .15, size.width, size.height * .19);

    path.lineTo(size.width, size.height * .18);
    path.lineTo(size.width, 0.0);
    path.close();

    paint.color = Color(0XFFED8080);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => old != this;

}