import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageBackground extends StatelessWidget {

  final screenHeight;

  const HomePageBackground({super.key, @required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: screenHeight * 0.5,
        color: themeData.primaryColor,
      ),
    );
  }
}
class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}