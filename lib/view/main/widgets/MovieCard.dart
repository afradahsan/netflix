import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.snapshot, super.key});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(0,5,10,10),
          child: Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('${baseImageURL}${snapshot.data[index].posterPath}',))),
          ),
        );
      },
    );
  }
}