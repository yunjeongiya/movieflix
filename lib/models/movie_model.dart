class MovieModel {
  final int id;
  final String posterPath, title;

  MovieModel.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        posterPath = json["poster_path"],
        title = json["title"];
}

/*
{"page":1,
"results":
[{"adult":false,
"backdrop_path":"/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
"genre_ids":[14,28,12],
"id":455476,
"original_language":"en",
"original_title":"Knights of the Zodiac",
"overview":"When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers,
 he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. 
 Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
 "popularity":3362.234,
 "poster_path":"/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
 "release_date":"2023-04-27",
 "title":"Knights of the Zodiac",
 "video":false,
 "vote_average":6.6,
 "vote_count":348},
 */