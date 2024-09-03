import 'package:flutter/material.dart';
import 'package:netflix/controller/home_controller.dart' show HomeController;
import 'package:netflix/controller/search_controller.dart'
    show SearchMovieController;
import 'package:netflix/controller/library_controller.dart'
    show LibraryController;
import 'package:netflix/controller/profile_controller.dart'
    show ProfileController;

class MainController extends StatefulWidget {
  const MainController({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MainController();
  }
}

class _MainController extends State<MainController> {
  int currentPageIndex = 3;
  Widget currentPage = const ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "HOME"),
            NavigationDestination(icon: Icon(Icons.search), label: "SEARCH"),
            NavigationDestination(
                icon: Icon(Icons.library_music), label: "LIBRARY"),
            NavigationDestination(icon: Icon(Icons.person), label: "PROFILE")
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              if (index == 0) {
                currentPage = const HomeController();
              } else if (index == 1) {
                currentPage = const SearchMovieController();
              } else if (index == 2) {
                currentPage = const LibraryController();
              } else {
                currentPage = const ProfileController();
              }
            });
          },
        ),
        body: currentPage);
  }
}
