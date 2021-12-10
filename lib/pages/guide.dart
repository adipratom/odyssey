import 'package:flutter/material.dart';
import 'package:odyssey/components/guide_component.dart';
import 'package:odyssey/model/profile_model.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

class Guide extends StatefulWidget {
  late final String id;
  Guide({required this.id});
  // const Guide({Key? key}) : super(key: key);

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  List<ProfileModel> _destinations = <ProfileModel>[];
  @override
  void initState() {
    super.initState();
    _populateDestinations();
  }

  void _populateDestinations() async {
    final destinations = await _fetchAllDestinations();
    setState(() {
      _destinations = destinations;
      print(_destinations);
    });
  }

  Future<List<ProfileModel>> _fetchAllDestinations() async {
    final response = await http.get(
        "https://odyssey-app-staging.herokuapp.com/api/v1/users/${widget.id}");

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(response.body);
      return result.map((item) => ProfileModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    const title = "Guide Profile";
    return SafeArea(
      child: FutureBuilder(
          future: _fetchAllDestinations(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return GuideComponent(profile: _destinations);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
