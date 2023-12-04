import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/controllers/bottom_navigator_controller.dart';
import 'package:movie_app/controllers/movies_controller.dart';
import 'package:movie_app/controllers/people_controller.dart';
import 'package:movie_app/controllers/search_controller.dart';
import 'package:movie_app/widgets/search_box.dart';
import 'package:movie_app/widgets/tab_builder.dart';
import 'package:movie_app/widgets/top_rated_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final MoviesController controller = Get.put(MoviesController());
  final PeopleController peoplecontroller = Get.put(PeopleController());
  final SearchControllerPerson searchController =
      Get.put(SearchControllerPerson());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 42,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What do you want to watch?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SearchBox(
              onSumbit: () {
                String search =
                    Get.find<SearchControllerPerson>().searchController.text;
                Get.find<SearchControllerPerson>().searchController.text = '';
                Get.find<SearchControllerPerson>().search(search);
                Get.find<BottomNavigatorController>().setIndex(1);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(
              height: 34,
            ),
            Obx(
              (() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 300,
                      child: ListView.separated(
                        itemCount: peoplecontroller.mainTopRatedPeople.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 24),
                        itemBuilder: (_, index) => TopRatedPersonItem(
                          person: peoplecontroller.mainTopRatedPeople[index],
                          index: index + 1,
                        ),
                      ),
                    )),
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TabBar(
                      indicatorWeight: 4,
                      indicatorColor: Color(
                        0xFF3A3F47,
                      ),
                      tabs: [
                        Tab(text: 'More popular'),
                      ]),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      TabBuilderPeople(
                        future: ApiService.getCustomPeople(
                            'popular?api_key=${Api.apiKey}&language=en-US&page=1'),
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
