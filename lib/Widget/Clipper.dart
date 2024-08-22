import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClipperWidget extends CustomClipper<Path> {
  double width;
  double height;
  ClipperWidget({required this.width, required this.height});
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(width * 0.0012778, height * 0.1893436);
    path_0.quadraticBezierTo(width * 0.0979167, height * 0.2248603,
        width * 0.14, height * 0.235);
    path_0.quadraticBezierTo(
        width * 0.18, height * 0.245, width * 0.2627778, height * 0.2312849);
    path_0.lineTo(width , height * 0.077);
    path_0.lineTo(width, height * 0);
    path_0.lineTo(width * 0, height * 0);
    path_0.lineTo(width * 0.0012778, height * 0.1893436);
    path_0.close();

    return path_0;
    // double radius = 100;
    //
    // Path path = Path();
    // path
    //   ..moveTo(width / 2, 0)
    //   ..arcToPoint(Offset(width, height), radius: Radius.circular(radius))
    //   ..lineTo(0, height)
    //   ..arcToPoint(
    //     Offset(width / 2, 0),
    //     radius: Radius.circular(radius),
    //   )
    //   ..close();
    //
    // return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
// class RPSCustomPainter extends CustomClipper<Path>  {
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//     Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(0, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
//
//     Path path_0 = Path();
//     path_0.moveTo(width * 0.0022222, height * 0.1621875);
//     path_0.quadraticBezierTo(width * 0.1824638, height * 0.2092187,
//         width * 0.2404831, height * 0.2237054);
//     path_0.cubicTo(
//         width * 0.2906522,
//         height * 0.2351116,
//         width * 0.3399758,
//         height * 0.2314955,
//         width * 0.3607729,
//         height * 0.2236161);
//     path_0.quadraticBezierTo(width * 0.5199758, height * 0.1679911,
//         width * 0.9975845, height * 0.0011161);
//
//     canvas.drawPath(path_0, paint_fill_0);
//
//     // Layer 1
//
//     Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(255, 0, 3, 5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
//
//     canvas.drawPath(path_0, paint_stroke_0);
//   }
//
//
// }
