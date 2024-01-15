import 'package:flutter/material.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/NumberCard.dart';
import 'package:netflix/view/main/widgets/maintitle.dart';

class Top10widget extends StatefulWidget {
  const Top10widget({required this.title, required this.getfunction, super.key});

  final String title;
  final Future<List<Movie>> getfunction;

  @override
  State<Top10widget> createState() => _Top10widgetState();
}

class _Top10widgetState extends State<Top10widget> {

  late Future<List<Movie>> movieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieList = widget.getfunction;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        MainTitle(title: widget.title),
        sizedten(context),
        LimitedBox(
          maxHeight: 160,
          child: FutureBuilder(
            future: movieList, 
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()));
              }else if(snapshot.hasData){
                return NumberCard(snapshot: snapshot);
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
          )
          // ListView(
          // scrollDirection: Axis.horizontal,
          // children: List.generate(10, (index) => MovieCard()),
          // ),
        )
      ],
    );
  }
}