import 'dart:async';

import 'package:fine_kube_machine_test/api_service/api_service.dart';
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

  StreamController<HomeScreenController> streamController = StreamController();

// class ApiService {
  List<PersonModel> personDataList = [];
  final apiUrl = 'https://finekube.com/interview/flutterTest.php';
  Future<List<PersonModel>> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable list = result['data'];
      personDataList = list.map((e) => PersonModel.fromJson(e)).toList();
      return personDataList;
    } else {
      throw ('Error occured');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fetchUserData();
  }
}

// }
