import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/person.dart';

class SearchControllerPerson extends GetxController {
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;
  var foundedPeople = <Person>[].obs;
  var isLoading = false.obs;
  void setSearchText(text) => searchText.value = text;
  void search(String query) async {
    isLoading.value = true;
    foundedPeople.value = (await ApiService.getSearchedPeople(query)) ?? [];
    isLoading.value = false;
  }
}
