class MovieDetailModel {
  final bool adult;
  final String title, overview;
  final List<String> genres;
  double voteAverage;
  MovieDetailModel.fromJSON(Map<String, dynamic> json)
      : title = json["title"],
        adult = json["adult"],
        overview = json["overview"],
        genres = [for (var genre in json["genres"]) genre["name"]],
        voteAverage = json["vote_average"];
}
