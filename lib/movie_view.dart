import 'package:desafio_flutter/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter/movie.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final controller = MovieController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.7))],
            ),
            child: Text(
              'Lançamentos',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.pink,
                    Colors.black,
                  ])),
              child: FutureBuilder<List<Movie>>(
                future: controller.loadmovie(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ocorreu um erro, tente novamente mais tarde!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(30),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Movie filme = snapshot.data[index];
                        return buildMovieCard(filme);
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildMovieCard(Movie filme) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: 400,
      height: 500,
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w300${filme.urlImage}',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          buildMovieRealeaseDate(filme),
          Positioned.fill(
            child: buildMovieTitle(filme),
          ),
        ],
      ),
    );
  }

  Positioned buildMovieRealeaseDate(Movie filme) {
    return Positioned(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(
          filme.releaseDate,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.70),
            )
          ],
        ),
      ),
      top: 8,
      right: 8,
    );
  }

  Align buildMovieTitle(Movie filme) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            filme.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.80),
            )
          ],
        ),
      ),
    );
  }
}
