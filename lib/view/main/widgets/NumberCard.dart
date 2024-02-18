import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/view/main/screens/moviedetails.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({required this.snapshot, super.key});

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 160,
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return MovieDetailsPage(snapshot: snapshot.data?[index]);
                        },));
                      },
                      child: Container(
                        width: 100, 
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  '$baseImageURL${snapshot.data?[index].posterPath}',
                                ))),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: -30,
                    left: -3,
                    child: BorderedText(
                      strokeColor: Colors.white,
                      strokeWidth: 2,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 120, color: Colors.black,
                        fontWeight: FontWeight.w600),
                      ),
                    ))
              ],
            );
          }
        )
    );
  }
}