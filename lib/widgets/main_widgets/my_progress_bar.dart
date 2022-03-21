import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String progessBarImage = 'assets/images/circle.svg';

class MyProgressBar extends StatelessWidget {
  double width;
  double rotate;
  MyProgressBar({Key? key, required this.width, required this.rotate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate,
      child: Container(
        child: SvgPicture.asset(
          progessBarImage,
          height: width,
          width: width,
        ),
      ),
    );
  }
}
