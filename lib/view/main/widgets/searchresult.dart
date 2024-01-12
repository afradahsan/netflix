import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MovieCard.dart';

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