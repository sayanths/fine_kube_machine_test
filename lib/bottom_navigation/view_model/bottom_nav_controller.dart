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

  List<Widget> widgetListBottomNav = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  
}
