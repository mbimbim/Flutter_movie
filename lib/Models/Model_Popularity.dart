class Model_Popularity {
  String backround_img = "";
  int id;
  String original_language = "";
  String original_title = "";
  String overview = "";
  String poster_path = "";
  String release_date = "";
  String title = "";
  bool video;
  double vote_average;
  int vote_count;

  Model_Popularity(
      {required this.backround_img,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory Model_Popularity.fromJson(Map<String, dynamic> json) =>
      Model_Popularity(
        backround_img: json["backdrop_path"],
        id: json["id"],
        original_language: json["original_language"],
        original_title: json["original_title"],
        overview: json["overview"],
        poster_path: json["poster_path"],
        release_date: json["release_date"],
        title: json["title"],
        video: json["video"],
        vote_average: json["vote_average"].toDouble(),
        vote_count: json["vote_count"],
      );
}
