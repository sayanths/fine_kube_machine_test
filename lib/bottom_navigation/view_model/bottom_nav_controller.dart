import 'package:fine_kube_machine_test/articles/view/articles.dart';
import 'package:fine_kube_machine_test/bottom_navigation/view/widgets/custom_button.dart';
import 'package:fine_kube_machine_test/history_page/view/view.dart';
import 'package:fine_kube_machine_test/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  var currentIndex = 0;

  changeIndex(newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
  ];

  List<Widget> images = [
    const CustomBottomNavImageContainer(
        image: "assets/home.png", title: "Home"),
    const CustomBottomNavImageContainer(
        image: "assets/history.png", title: "History"),
    const CustomBottomNavImageContainer(
        image: "assets/articles.png", title: "Article"),
  ];

  List<Widget> widgetListBottomNav = [
    const HomeScreen(),
    const HistoryPage(),
    const ArticlePage(),
  ];
}

