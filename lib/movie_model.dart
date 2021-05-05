import 'package:desafio_flutter/movie.dart';
import 'api.dart';

class MovieModel {
  Future<List<Movie>> _movie;
  Future<List<Movie>> get movie => _movie;

  Future<List<Movie>> fetchMovie() {
    return _movie = API().fetchMovie();
  }
}
