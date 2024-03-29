import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {

  final screenHeight;

  const HomePageBackground({super.key, @required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    // With the help of the clippath class we can give a container any irregular shape with want other than a normal rectangle or square or circle
    return Column(
      children: [
        ClipPath(
          clipper: BottomShapeClipper(),
          child: Container(
            height: screenHeight * 0.5,
            color: themeData.primaryColor,
          ),
        ),
        Text('here', style: TextStyle(fontSize: 40),),
      ],
    );
  }
}
class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    // Creates the outline for the shape and as the shape is already provided with the background color.
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}