// ignore_for_file: avoid_print, unused_import, prefer_final_fields, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:odyssey/components/profile_component.dart';
import 'package:odyssey/model/profile_model.dart';
import 'package:odyssey/pages/edit_profile.dart';
import 'package:odyssey/pages/guide.dart';
import 'package:odyssey/pages/settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 3;

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
        "http://192.168.18.6:3000/api/v1/users/6185512b11cd9b410c43833a");

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
    return SafeArea(
        child: FutureBuilder(
            future: _fetchAllDestinations(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ProfileComponent(profile: _destinations);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
