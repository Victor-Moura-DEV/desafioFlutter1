import 'package:desafio_flutter/api.dart';
import 'package:desafio_flutter/movie.dart';
import 'package:desafio_flutter/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FetchMovie should fill movie variable', () {
    final model = MovieModel(api: MockMovie());

    model.fetchMovie();

    expect(model.movie, completion(isNotNull));

    model.movie.then((movie) {
      expect(movie[0].title, 'Três mosqueteiro');
    });
  });
}

class MockMovie extends API {
  @override
  Future<List<Movie>> fetchMovie() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    List<Movie> filmePirata = [];
    for (var index = 0; index < 3; index++) {
      filmePirata.add(
        Movie('Três mosqueteiros', '27/08/01', 'null'),
      );
    }
    return filmePirata;
  }
}
