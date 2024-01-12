import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MovieCard.dart';
import 'package:netflix/view/main/widgets/maintitle.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({required this.title, super.key});

  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        MainTitle(title: title),
        sizedten(context),
        LimitedBox(
          maxHeight: 160,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) => MovieCard()),
          ),
        ) 
      ],
    );
  }
}

