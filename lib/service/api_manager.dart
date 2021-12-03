import 'dart:convert';

import 'package:odyssey/model/destination.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Destination> getDestination() async {
    var client = http.Client();
    var destinations = null;

    try {
      var response =
          await client.get("http://192.168.100.10:3000/api/v1/destination");
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
