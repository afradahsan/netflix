import 'package:netflix/controller/secrets.dart';

//Base url is something thats the starting of the
const baseURL = 'https://api.themoviedb.org/3';
const baseImageURL = 'https://image.tmdb.org/t/p/w500';

const trendingday = '$baseURL/trending/all/day?api_key=$apikey';

const upcoming = '$baseURL/movie/upcoming?api_key=$apikey';

const topten = '$baseURL/movie/top_rated?api_key=$apikey';