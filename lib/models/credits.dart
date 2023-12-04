import 'dart:convert';

class CastMember {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String character;
  String creditId;
  int order;
  String mediaType;

  CastMember({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.character,
    required this.creditId,
    required this.order,
    required this.mediaType,
  });

  factory CastMember.fromMap(Map<String, dynamic> map) {
    return CastMember(
      adult: map['adult'] as bool,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'] as int,
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] as bool,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count'] as int,
      character: map['character'] ?? '',
      creditId: map['credit_id'] ?? '',
      order: map['order'] as int,
      mediaType: map['media_type'] ?? '',
    );
  }

  factory CastMember.fromJson(String source) =>
      CastMember.fromMap(json.decode(source));
}
