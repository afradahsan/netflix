import 'dart:convert';

import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<List<Movie>> getTrendingMovies() async{
    final uri = Uri.parse(trendingday);
    final response = await http.get(uri);
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

  Future<List<Movie>> getUpcomingMovies() async{
    final uri = Uri.parse(upcoming);
    final response = await http.get(uri);
    print(response.statusCode);

    if(response.statusCode==200){
      final decodeData = jsonDecode(response.body);
      final upcomingList = decodeData['results'] as List;
      return upcomingList.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('errrorr upcoming');
    }
  }

  Future<List<Movie>> getToptenMovies() async{
    final uri = Uri.parse(topten);
    final response = await http.get(uri);

    print(response.statusCode);

    if(response.statusCode==200){
      final decodeData = jsonDecode(response.body);
      final top10List = decodeData['results'] as List;
      return top10List.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('top 10 error');
    }
  }
}