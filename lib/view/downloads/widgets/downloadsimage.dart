import 'dart:math';

import 'package:flutter/material.dart';

class DownlImageWidget extends StatelessWidget {
  DownlImageWidget({required this.image,required this.angle, required this.pos, super.key});

  String? image;
  EdgeInsets? pos;
  double angle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle*pi/180,
      child: Container(
        margin: pos,
        width: size.width * 0.3,
        height: size.width * 0.48,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image!),fit: BoxFit.fill)
      ),),
    );
  }
}