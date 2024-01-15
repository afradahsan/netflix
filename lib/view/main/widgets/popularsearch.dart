import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MovieCard.dart';
import 'package:netflix/view/main/widgets/maintitle.dart';

class PopularSearch extends StatefulWidget {
  const PopularSearch({super.key});

  @override
  State<PopularSearch> createState() => _PopularSearchState();
}

class _PopularSearchState extends State<PopularSearch> {
  final Future<List<Movie>> popularsearch = ApiService().getTrendingMovies();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: 'Popular Search'),
          sizedten(context),
          Expanded(
            child: FutureBuilder(
            future: popularsearch, 
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()));
              }else if(snapshot.hasData){
                return SearchTile(snapshot: snapshot,);
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
          )
          )
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({required this.snapshot, super.key});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                  height: size.width * 0.2,
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage('$baseImageURL${snapshot.data[index].backDropPath}',
                    ), fit: BoxFit.cover)
                    ),),
              sizedwten(context),
              Text(
                '${snapshot.data[index].title}',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Icon(
                CupertinoIcons.play_circle,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
        );
      }
    );
  }
}
