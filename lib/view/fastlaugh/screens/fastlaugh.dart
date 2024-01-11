import 'package:flutter/material.dart';
import 'package:netflix/view/fastlaugh/widgets/videolist.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,          children: 
            List.generate(10, (index) => VideoList(index: index,))
        )
      ), 
    );
  }
} 