import 'dart:convert';

class Details {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  String? deathday;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  Details({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      adult: map['adult'] as bool,
      alsoKnownAs: List<String>.from(map['also_known_as']),
      biography: map['biography'] ?? '',
      birthday: map['birthday'] ?? '',
      deathday: map['deathday'],
      gender: map['gender'] as int,
      homepage: map['homepage'],
      id: map['id'] as int,
      imdbId: map['imdb_id'] ?? '',
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      placeOfBirth: map['place_of_birth'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      profilePath: map['profile_path'] ?? '',
    );
  }

  factory Details.fromJson(String source) =>
      Details.fromMap(json.decode(source));
}
