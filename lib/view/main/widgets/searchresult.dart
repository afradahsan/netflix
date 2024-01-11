import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text('Movies & TV',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
      sizedten(context),
      Expanded(child: GridView.count(
        shrinkWrap: true, 
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1/1.6,
        children: List.generate(20, (index) => MovieCard()),
      )) 
    ],);
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',))),
    );
  }
}