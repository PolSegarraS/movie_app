class KnownFor {
  bool adult;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  KnownFor({
    required this.adult,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory KnownFor.fromMap(Map<String, dynamic> map) {
    return KnownFor(
      adult: map['adult'] ?? false,
      id: map['id'] as int,
      title: map['title'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      mediaType: map['media_type'] ?? '',
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      popularity: map['popularity']?.toDouble() ?? 0.0,
      releaseDate: map['release_date'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count'] as int,
    );
  }
}
