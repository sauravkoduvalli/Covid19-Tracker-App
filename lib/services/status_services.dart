import 'dart:convert';

import 'package:covid19_tracker/models/world_status_model.dart';
import 'package:covid19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatusServices {
  Future<WorldStatusModel> fetchWorldStatesData() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatusModel.fromJson(data);
    } else {
      throw Exception("WorldStatus Api is not working");
    }
  }

  Future<List<dynamic>> fetchCountriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("CountriesList Api is not working");
    }
  }
}
