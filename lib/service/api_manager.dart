// ignore_for_file: import_of_legacy_library_into_null_safe, camel_case_types, avoid_init_to_null, unused_local_variable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:convert';

import 'package:odyssey/model/destination.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Destination> getDestination() async {
    var client = http.Client();
    var destinations = null;

    try {
      var response = await client
          .get("http://192.168.18.6:3000/api/v1/destination");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        var destinations = Destination.fromJson(jsonMap);
      }
    } catch (Exception) {
      return destinations;
    }

    return destinations;
  }
}
