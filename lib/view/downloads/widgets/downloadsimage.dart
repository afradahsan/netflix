import 'dart:math';

import 'package:flutter/material.dart';

class DownlImageWidget extends StatelessWidget {
  DownlImageWidget({required this.image,required this.angle, required this.pos,required this.w, required this.h, super.key});

  String? image;
  EdgeInsets? pos;
  double angle;
  double w,h;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle*pi/180,
      child: Container(
        margin: pos,
        width: size.width * w,
        height: size.width * h,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 15, color: const Color.fromARGB(180, 0, 0, 0))],
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image!),fit: BoxFit.fill)
      ),),
    );
  }
}