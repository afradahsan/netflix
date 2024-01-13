import 'dart:convert';

import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<Movie>> getTrendingMovies() async{
    final uri = Uri.parse(trendingday);
    final response = await http.get(uri);
    print(response.body);
    print(response.statusCode);

    if(response.statusCode==200){
      final decodedata = jsonDecode(response.body);
      final movieList = decodedata['results'] as List;
      print(movieList);
      return movieList.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error');
    }
  }

  // Future<List<Movie>> 
}