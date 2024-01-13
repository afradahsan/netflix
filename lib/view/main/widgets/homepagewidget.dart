import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MovieCard.dart';
import 'package:netflix/view/main/widgets/maintitle.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({required this.title,required this.getfunction, super.key});

  final String title;
  final Future<List<Movie>> getfunction;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
                return MovieCard(snapshot: snapshot);
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

