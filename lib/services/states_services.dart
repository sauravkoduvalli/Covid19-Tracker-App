import 'dart:convert';

import 'package:covid19_tracker/models/world_status_model.dart';
import 'package:covid19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatusModel> fetchWorldStatesData() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatusModel.fromJson(data);
    } else {
      throw Exception("fetchWorldStatesData function not working");
    }
  }
}
