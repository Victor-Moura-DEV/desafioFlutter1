import 'dart:convert';

import 'package:desafio_flutter/movie.dart';
import 'package:http/http.dart' as http;

class API {
  const API();

  Future<List<Movie>> fetchMovie() async {
    final response = await http.get(Uri.https(
      'api.themoviedb.org',
      '/3/movie/upcoming',
      {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'},
    ));
    if (response.statusCode == 200) {
      List<Movie> arrayMovies = [];

      final json = jsonDecode(response.body);
      List<dynamic> data = json['results'];
      data.forEach((element) {
        arrayMovies.add(Movie.fromJson(element));
      });
      return arrayMovies;
    } else {
      return Future.error('Connection lost');
    }
  }
}
