import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final int index;
  const VideoList({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
      ],
    );
  }
}