import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:odyssey/components/card_stateless.dart';
import 'package:odyssey/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'package:odyssey/model/destination.dart';

class Explore extends StatefulWidget {
  late final String name;
  Explore({required this.name});
  @override
  State<StatefulWidget> createState() => ExplorePage();
}

class ExplorePage extends State<Explore> {
  TextEditingController nameController = TextEditingController();
  List<Destination> _destinations = <Destination>[];
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

  Future<List<Destination>> _fetchAllDestinations() async {
    late final response ;
    if (widget.name == '') {
      response = await http
          .get("http://192.168.18.6:3000/api/v1/destination");
    } else {
      response = await http.get(
          "http://192.168.18.6:3000/api/v1/destination/name/${widget.name}");
    }
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      // print(response.body);
      return result.map((item) => Destination.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Odyssey Explore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    height: size.height * 0.95,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff21574A), Colors.white])),
                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 54,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Colors.black.withOpacity(0.23))
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: nameController,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      decoration: InputDecoration(
                                        hintText:
                                            "Search a place you want to go...",
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Explore(name: nameController.text)))
                                      },
                                      icon: Icon(Icons.search,
                                          color: Colors.white)),
                                ],
                              ))),
                      Positioned(
                          top: size.height * 0.125,
                          left: 0,
                          right: 0,
                          child: CardStateless(destination: _destinations))
                    ])))),
      ),
    );
  }
}
