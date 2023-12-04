import 'dart:convert';

import 'package:movie_app/models/known_for.dart';

class Person {
  int id;
  String name;
  String originalName;
  String mediaType;
  double popularity;
  int gender;
  String knownForDepartment;
  String profilePath;
  List<KnownFor> knownFor;

  Person({
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
  });

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as int,
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      mediaType: map['media_type'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      gender: map['gender'] as int,
      knownForDepartment: map['known_for_department'] ?? '',
      profilePath: map['profile_path'] ?? '',
      knownFor: List<KnownFor>.from(
        map['known_for']?.map((x) => KnownFor.fromMap(x)) ?? [],
      ),
    );
  }

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
