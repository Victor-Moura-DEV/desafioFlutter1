import 'package:desafio_flutter/movie.dart';
import 'package:desafio_flutter/movie_model.dart';

class MovieController {
  final model = MovieModel();
  Future<List<Movie>> get movie => model.movie;

  Future<List<Movie>> loadmovie() async {
    return await model.fetchMovie();
  }
}
