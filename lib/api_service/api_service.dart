import 'dart:convert';

import 'package:fine_kube_machine_test/home_screen/model/person_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<PersonModel> personDataList = [];
  final apiUrl = 'https://finekube.com/interview/flutterTest.php';
  Future<List<PersonModel>> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      Map<String, dynamic> result = jsonDecode(response.body);
      List<dynamic> list = result['data'];
      personDataList = list.map((e) => PersonModel.fromJson(e)).toList();
      return personDataList;
    } else {
      throw ('Error occured');
    }
  }
}
