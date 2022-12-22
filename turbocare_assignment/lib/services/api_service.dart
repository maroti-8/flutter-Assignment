import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<dynamic> fetchTwoWheeler() async {
    final response = await client.get(
        Uri.parse('https://test.turbocare.app/turbo/care/v1/makes?class=2w'));

    if (response.statusCode == 200) {
      List<String> twoWhheelerFromJson(String str) =>
          List<String>.from(json.decode(str).map((x) => x));
      return twoWhheelerFromJson(response.body);
    } else {
      return print(response.statusCode);
    }
  }

  static Future<dynamic> fetchFourWheeler() async {
    final response = await client.get(
        Uri.parse('https://test.turbocare.app/turbo/care/v1/makes?class=4w'));

    if (response.statusCode == 200) {
      List<String> fourWheelerFromJson(String str) =>
          List<String>.from(json.decode(str).map((x) => x));

      return fourWheelerFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> fetchModels() async {
    final response = await client.get(Uri.parse(
        'https://test.turbocare.app/turbo/care/v1/models?class=2w&make=honda'));

    if (response.statusCode == 200) {
      List<String> modelsFromJson(String str) =>
          List<String>.from(json.decode(str).map((x) => x));
      return modelsFromJson(response.body);
    } else {
      print('API is not Availabel');
    }
  }
}
