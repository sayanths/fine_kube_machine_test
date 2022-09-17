import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:fine_kube_machine_test/home_screen/model/person_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends ChangeNotifier {
  HomeScreenController() {
    fetchUserData();
  }
  Future<void> refreshList() async {
    await fetchUserData();
    notifyListeners();
  }

  //StreamController<HomeScreenController> streamController = StreamController();

  List<ModelClass> personDataList = [];
  final apiUrl = 'https://finekube.com/interview/flutterTest.php';
  Future<List<ModelClass>> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable list = result['data'];
      personDataList = list.map((e) => ModelClass.fromJson(e)).toList();
      return personDataList;
    } else {
      throw ('Error occured');
    }
  }
}
