import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  var currentIndex = 0;

  changeIndex(newIndex) {
    currentIndex= newIndex;
    notifyListeners();
  }

    List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
  ];
}
