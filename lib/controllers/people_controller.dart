import 'package:get/get.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/models/person.dart';

class PeopleController extends GetxController {
  var isLoading = false.obs;
  var mainTopRatedPeople = <Person>[].obs;
  var watchListPeople = <Person>[].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    mainTopRatedPeople.value = (await ApiService.getTopRatedPeople())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Person person) {
    return watchListPeople.any((p) => p.id == person.id);
  }

  void addToWatchList(Person person) {
    if (watchListPeople.any((p) => p.id == person.id)) {
      watchListPeople.remove(person);
      Get.snackbar('Success', 'removed from watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    } else {
      watchListPeople.add(person);
      Get.snackbar('Success', 'added to watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    }
  }
}
