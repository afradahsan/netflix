import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MovieCard.dart';
import 'package:netflix/view/main/widgets/NumberCard.dart';
import 'package:netflix/view/main/widgets/popularsearch.dart';
import 'package:netflix/view/main/widgets/searchreswidget.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({required this.searchList, super.key});

  final List searchList;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  final Future<List<Movie>> searchresult = ApiService().getTrendingMovies();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text('Movies & TV',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
        sizedten(context),
        FutureBuilder(
          future: searchresult, 
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            else if(snapshot.hasData){
              return SearchresWidget(searchList: widget.searchList);
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
          )      
      ],),
    );
  }
}