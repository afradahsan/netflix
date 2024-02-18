import 'package:flutter/foundation.dart';

class Movie {
  // int id;
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  String? language;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.language
  });

  factory Movie.fromJson(Map<String, dynamic> jsonMap) {
    return Movie(
        title: jsonMap['title'] ?? 'Movie name null -',
        backDropPath: jsonMap['backdrop_path'],
        originalTitle: jsonMap['original_title'],
        overview: jsonMap['overview'],
        posterPath: jsonMap['poster_path'],
        releaseDate: jsonMap['release_date'],
        voteAverage: jsonMap['vote_average'],
        language: jsonMap['original_language']
      );
  }
}
