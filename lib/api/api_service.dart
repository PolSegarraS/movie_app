import 'dart:convert';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/credits.dart';
import 'package:movie_app/models/details.dart';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/person.dart';
import 'package:movie_app/models/review.dart';

class ApiService {
  static Future<List<Movie>?> getTopRatedMovies() async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}movie/top_rated?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(6).take(5).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getCustomMovies(String url) async {
    List<Movie> movies = [];
    try {
      http.Response response =
          await http.get(Uri.parse('${Api.baseUrl}movie/$url'));
      var res = jsonDecode(response.body);
      res['results'].take(6).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getSearchedMovies(String query) async {
    List<Movie> movies = [];
    String apiKey = Api.apiKey;
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (m) => movies.add(
          Movie.fromMap(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getMovieReviews(int movieId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (r) {
          reviews.add(
            Review(
                author: r['author'],
                comment: r['content'],
                rating: r['author_details']['rating']),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Person>?> getTopRatedPeople() async {
    List<Person> people = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}person/popular?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(6).take(5).forEach(
            (p) => people.add(
              Person.fromMap(p),
            ),
          );
      return people;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Person>?> getCustomPeople(String url) async {
    List<Person> people = [];
    try {
      http.Response response =
          await http.get(Uri.parse('${Api.baseUrl}person/$url'));
      var res = jsonDecode(response.body);
      res['results'].take(6).forEach(
            (p) => people.add(
              Person.fromMap(p),
            ),
          );
      return people;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Person>?> getSearchedPeople(String query) async {
    List<Person> people = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/person?api_key=YourApiKey&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (p) => people.add(
          Person.fromMap(p),
        ),
      );
      return people;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getPersonReviews(int personId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/person/$personId/reviews?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (r) {
          reviews.add(
            Review(
              author: r['author'],
              comment: r['content'],
              rating: r['author_details']['rating'],
            ),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }

  static Future<List<CastMember>?> getCustomCastMembers(int id) async {
    List<CastMember> castMembers = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/person/$id/combined_credits?api_key=${Api.apiKey}&language=en-US'));
      var res = jsonDecode(response.body);
      List<dynamic> castList = res['cast'];
      castList.take(6).forEach(
            (cast) => castMembers.add(
              CastMember.fromMap(cast),
            ),
          );
      return castMembers;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Details>?> getCustomDetails(int id) async {
    List<Details> detailsList = [];
    try {
      http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id?api_key=${Api.apiKey}&language=en-US',
      ));
      var res = jsonDecode(response.body);
      detailsList.add(Details.fromMap(res));
      return detailsList;
    } catch (e) {
      return null;
    }
  }
}
