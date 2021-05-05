class Movie {
  String title;
  String urlImage;
  String releaseDate;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['poster_path'];
    releaseDate = json['release_date'];
  }
}
