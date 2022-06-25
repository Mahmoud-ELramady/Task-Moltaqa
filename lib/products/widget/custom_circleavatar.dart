import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  final Color color;
  const CustomCircleAvatar({Key? key, required this.image, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: SvgPicture.asset(
        image,
        width: 25,
        height: 25,
      ),
    );
  }
}
