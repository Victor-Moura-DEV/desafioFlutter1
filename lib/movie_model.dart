import 'package:desafio_flutter/movie.dart';
import 'api.dart';

class MovieModel {
  final API api;

  Future<List<Movie>> _movie;
  Future<List<Movie>> get movie => _movie;

  MovieModel({this.api = const API()});

  Future<List<Movie>> fetchMovie() {
    return _movie = api.fetchMovie();
  }
}
