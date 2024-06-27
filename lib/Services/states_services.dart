import 'dart:convert';

import 'package:covid_19/Modal/world_states_model.dart';
import 'package:covid_19/Services/utilities/app_url.dart';
// import 'package:flutter/material.dart';
import "package:http/http.dart " as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  Future<List<dynamic>> fetchWorldCountry() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    final response = await http.get(Uri.parse(AppUrl.contriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return (data);
    } else {
      throw Exception("error");
    }
  }
}
